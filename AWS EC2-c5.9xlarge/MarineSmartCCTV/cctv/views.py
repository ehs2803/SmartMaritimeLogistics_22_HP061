from threading import Thread

from django.contrib.auth.models import User
from django.http import StreamingHttpResponse, JsonResponse
from django.shortcuts import render, redirect

# Create your views here.
from django.views.decorators.csrf import csrf_exempt

from account.models import AuthUser
from cctv.connect.socket import VideoCamera
from cctv.models import Alarm, Cctv

CAMERA = None

def landing(request):
    global CAMERA
    user = None
    if CAMERA==None:
        CAMERA = VideoCamera()
        socket_run = Thread(target=CAMERA.run_server)
        socket_run.start()
    if request.session.get('id'):
        user = User.objects.get(id=request.session.get('id'))

    context = {
        'user': user
    }
    return render(request, "cctv/index.html", context=context)

def list(request):
    user = None
    connectNum = None
    idList = ''
    if request.session.get('id'):
        user = User.objects.get(id=request.session.get('id'))
        if CAMERA.threads.get(user.username):
            connectNum = CAMERA.threads.get(user.username).cnt
            for key in CAMERA.threads[user.username].connections:
                idList+=key
                idList+=' '
        else:
            connectNum = 0
    idList.rstrip()

    print(idList)
    context = {
        'user': user,
        'cnt' : connectNum,
        'idList' : idList,
    }
    return render(request, "cctv/cctv_list.html", context=context)

def list_mypage(request):
    user = None
    connectNum = None
    idList = ''
    if request.session.get('id'):
        user = User.objects.get(id=request.session.get('id'))
        if CAMERA.threads.get(user.username):
            connectNum = CAMERA.threads.get(user.username).cnt
            for key in CAMERA.threads[user.username].connections:
                idList += key
                idList += ' '
        else:
            connectNum = 0
    idList.rstrip()

    context = {
        'user': user,
        'cnt': connectNum,
        'idList': idList,
    }
    return render(request, "cctv/mypage/cctv_live_list.html", context=context)

def live(request, username, id):
    user = None
    alarmCnt = None
    alarmList_0 = None
    alarmList_1 = None
    camid=id
    cctv = None
    policy = {}
    if request.session.get('id'):
        cctv = Cctv.objects.get(camid=camid)
        user = User.objects.get(id=request.session.get('id'))
        alarmCnt = Alarm.objects.filter(confirm=0).count()
        alarmList_0 = Alarm.objects.filter(confirm=0).order_by('-time')
        alarmList_1 = Alarm.objects.filter(confirm=1).order_by('-time')

    if cctv != None:
        policy['fire'] = cctv.po_fire
        policy['person'] = cctv.po_person
        policy['person_cnt'] = cctv.po_person_cnt
        policy['falldown'] = cctv.po_falldown
        policy['helmet'] = cctv.po_helmet
    camid = id
    context = {
        'user': user,
        'id' : camid,
        'alarmCnt' : alarmCnt,
        'alarmList_0' : alarmList_0,
        'alarmList_1' : alarmList_1,
        'camid' : camid,
        'policy': policy,
    }
    return render(request, "cctv/mypage/cctv_live.html", context=context)

def gen(camera, username, id):
    while True:
        if camera.threads.get(username):
            break
    client = camera.threads[username]
    while True:
        try:
            frame = client.connections[id].get_frame()
        except:
            pass
        yield (b'--frame\r\n'
                b'Content-Type: image/jpeg\r\n\r\n' + frame + b'\r\n\r\n')


def video(request, username, id):
    return StreamingHttpResponse(gen(CAMERA, username, id),
                    content_type='multipart/x-mixed-replace; boundary=frame')


def config_mode_fire(request, id):
    global CAMERA
    if request.session.get('id'):
        user = User.objects.get(id=request.session.get('id'))
        cctv = Cctv.objects.get(camid=id)
        cctv.po_fire = 1-cctv.po_fire
        cctv.save()
        if CAMERA.threads.get(user.username):
            client = CAMERA.threads[user.username]
            if client.connections[id]!=None:
                client.connections[id].policy_fire=cctv.po_fire
        return redirect('/mypage/cctv/'+id)

def config_mode_person(request, id):
    global CAMERA
    if request.session.get('id'):
        user = User.objects.get(id=request.session.get('id'))
        cctv = Cctv.objects.get(camid=id)
        cctv.po_person = 1-cctv.po_person
        cctv.save()
        if CAMERA.threads.get(user.username):
            client = CAMERA.threads[user.username]
            if client.connections[id] != None:
                client.connections[id].policy_person=cctv.po_person
        return redirect('/mypage/cctv/'+id)

@csrf_exempt
def config_mode_person_cnt(request, id):
    global CAMERA
    if request.session.get('id'):
        user = User.objects.get(id=request.session.get('id'))
        cnt = request.POST['cnt']
        cctv = Cctv.objects.get(camid=id)
        cctv.po_person_cnt = cnt
        cctv.save()
        if CAMERA.threads.get(user.username):
            client = CAMERA.threads[user.username]
            if client.connections[id] != None:
                client.connections[id].policy_person_cnt = cctv.po_person_cnt
        return redirect('/mypage/cctv/'+id)

def config_mode_falldown(request, id):
    global CAMERA
    if request.session.get('id'):
        user = User.objects.get(id=request.session.get('id'))
        cctv = Cctv.objects.get(camid=id)
        cctv.po_falldown = 1-cctv.po_falldown
        cctv.save()
        if CAMERA.threads.get(user.username):
            client = CAMERA.threads[user.username]
            if client.connections[id] != None:
                client.connections[id].policy_falldown = cctv.po_falldown
        return redirect('/mypage/cctv/'+id)

def config_mode_helmet(request, id):
    global CAMERA
    if request.session.get('id'):
        user = User.objects.get(id=request.session.get('id'))
        cctv = Cctv.objects.get(camid=id)
        cctv.po_helmet = 1-cctv.po_helmet
        cctv.save()
        if CAMERA.threads.get(user.username):
            client = CAMERA.threads[user.username]
            if client.connections[id] != None:
                client.connections[id].policy_helmet = cctv.po_helmet
        return redirect('/mypage/cctv/'+id)

def config_mode_fire_live(request, id):
    global CAMERA
    if request.session.get('id'):
        user = User.objects.get(id=request.session.get('id'))
        cctv = Cctv.objects.get(camid=id)
        cctv.po_fire = 1-cctv.po_fire
        cctv.save()
        if CAMERA.threads.get(user.username):
            client = CAMERA.threads[user.username]
            if client.connections[id]!=None:
                client.connections[id].policy_fire=cctv.po_fire
        return redirect('/cctv/live/'+user.username+'/'+id)

def config_mode_person_live(request, id):
    global CAMERA
    if request.session.get('id'):
        user = User.objects.get(id=request.session.get('id'))
        cctv = Cctv.objects.get(camid=id)
        cctv.po_person = 1-cctv.po_person
        cctv.save()
        if CAMERA.threads.get(user.username):
            client = CAMERA.threads[user.username]
            if client.connections[id] != None:
                client.connections[id].policy_person=cctv.po_person
        return redirect('/cctv/live/'+user.username+'/'+id)

@csrf_exempt
def config_mode_person_cnt_live(request, id):
    global CAMERA
    if request.session.get('id'):
        user = User.objects.get(id=request.session.get('id'))
        cnt = request.POST['cnt']
        cctv = Cctv.objects.get(camid=id)
        cctv.po_person_cnt = cnt
        cctv.save()
        if CAMERA.threads.get(user.username):
            client = CAMERA.threads[user.username]
            if client.connections[id] != None:
                client.connections[id].policy_person_cnt = cctv.po_person_cnt
        return redirect('/cctv/live/'+user.username+'/'+id)

def config_mode_falldown_live(request, id):
    global CAMERA
    if request.session.get('id'):
        user = User.objects.get(id=request.session.get('id'))
        cctv = Cctv.objects.get(camid=id)
        cctv.po_falldown = 1-cctv.po_falldown
        cctv.save()
        if CAMERA.threads.get(user.username):
            client = CAMERA.threads[user.username]
            if client.connections[id] != None:
                client.connections[id].policy_falldown = cctv.po_falldown
        return redirect('/cctv/live/'+user.username+'/'+id)

def config_mode_helmet_live(request, id):
    global CAMERA
    if request.session.get('id'):
        user = User.objects.get(id=request.session.get('id'))
        cctv = Cctv.objects.get(camid=id)
        cctv.po_helmet = 1-cctv.po_helmet
        cctv.save()
        if CAMERA.threads.get(user.username):
            client = CAMERA.threads[user.username]
            if client.connections[id] != None:
                client.connections[id].policy_helmet = cctv.po_helmet
        return redirect('/cctv/live/'+user.username+'/'+id)

@csrf_exempt
def ajax_connect_config(request, username, id):
    sendmessage = ""
    receive_message = request.POST.get('send_data')
    if CAMERA.threads.get(username):
        if CAMERA.threads.get(username).cnt>0:
            if CAMERA.threads.get(username).connections.get(id):
                sendmessage="1"
            else:
                sendmessage="0"
        else:
            sendmessage="0"
    else:
        sendmessage="0"
    send_message = {'send_data' : sendmessage}
    return JsonResponse(send_message) # 라즈베리파이 연결 여부

@csrf_exempt
def ajax_disconnect(request, username, id):
    client = CAMERA.threads.get(username)
    #client.disconnect_socket(id)
    client.connections[id].check=True
    send_message = {'send_data' : '1'}
    return JsonResponse(send_message)

@csrf_exempt
def ajax_capture(request, username, id):
    user = AuthUser.objects.get(pk=request.session.get('id'))
    client = CAMERA.threads[username]
    check = client.connections[id].capture_picture(user)
    send_message = {'send_data': '1'}
    return JsonResponse(send_message)

@csrf_exempt
def ajax_video_recording(request, username, id):
    user = AuthUser.objects.get(pk=request.session.get('id'))
    client = CAMERA.threads[username]
    client.connections[id].recording_video(user)
    send_message = {'send_data' : '1'}
    return JsonResponse(send_message)

@csrf_exempt
def config_Recording(request, username, id):
    client = CAMERA.threads[username]
    check = client.connections[id].check_current_recording
    if check:
        send_message = {'send_data': '1'}
    else:
        send_message = {'send_data': '0'}
    return JsonResponse(send_message)

@csrf_exempt
def main_state(request):
    user=None
    if request.session.get('id'):
        user = User.objects.get(id=request.session.get('id'))
    uid = request.POST.get('send_data')
    cctv_list = Cctv.objects.filter(uid=uid)
    data= {}
    for cctv in cctv_list:
        data_dic = {}
        data_dic['camid'] = cctv.camid
        data_dic['connect'] = 0
        data_dic['alarm'] = 0
        if CAMERA.threads.get(user.username):
            if CAMERA.threads.get(user.username).cnt > 0:
                if CAMERA.threads.get(user.username).connections.get(cctv.camid):
                    data_dic['connect'] = 1
        alarm_list = Alarm.objects.filter(camid=cctv.camid, confirm=0)
        print(alarm_list.count())
        if(alarm_list.count()>0):
            data_dic['alarm']=1
        if data_dic['connect'] ==0:
            data_dic['alarm'] = 0
        data[cctv.camid]=data_dic

    send_message = data
    print(send_message)
    return JsonResponse(send_message)
