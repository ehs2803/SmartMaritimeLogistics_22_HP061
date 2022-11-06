import os
import time

from PIL import Image
from django.core.files import File
import cv2
import struct
import pickle
import datetime
from django.core.files.base import ContentFile
from django.core.files.images import ImageFile

from MarineSmartCCTV.settings import BASE_DIR
from account.models import AuthUser
from cctv.detect.falldown import FallDownDetector
from cctv.detect.fire import FireDetector
from cctv.detect.helmet import HelmetDetector
from cctv.detect.person import PersonDetector
from cctv.models import CapturePicture, RecordingVideo


class Frame:
    def __init__(self, client_socket, username, camid, policy):
        self.username = username
        self.camid = camid
        self.client_socket = client_socket
        self.data_buffer = b""
        self.data_size = struct.calcsize("L")
        self.imageFrame = None
        self.imagesave = None
        self.check = False

        self.recording_video_check = False
        self.out = None
        self.rvfilename = None

        self.check_current_recording = False

        # policy
        self.policy_fire=policy['po_fire']
        self.policy_person=policy['po_person']
        self.policy_person_cnt=policy['po_person_cnt']
        self.policy_falldown=policy['po_falldown']
        self.policy_helmet = policy['po_helmet']

        # detector
        self.FireDetector = FireDetector(username)
        self.PersonDetector = PersonDetector(username)
        self.FallDownDetector = FallDownDetector(username)
        self.HelmetDetector = HelmetDetector(username)


    def detect_live(self):
        while True:
            if self.check == True:
                return
            # 설정한 데이터의 크기보다 버퍼에 저장된 데이터의 크기가 작은 경우
            while len(self.data_buffer) < self.data_size:
                # 데이터 수신
                try:
                    self.data_buffer += self.client_socket.recv(4096)
                except:
                    return

            self.client_socket.sendall("10".encode())
            # 버퍼의 저장된 데이터 분할
            packed_data_size = self.data_buffer[:self.data_size]
            self.data_buffer = self.data_buffer[self.data_size:]
            # struct.unpack : 변환된 바이트 객체를 원래의 데이터로 변환
            frame_size = struct.unpack(">Q", packed_data_size)[0]
            # 프레임 데이터의 크기보다 버퍼에 저장된 데이터의 크기가 작은 경우
            while len(self.data_buffer) < frame_size:
                # 데이터 수신
                try:
                    self.data_buffer += self.client_socket.recv(4096)
                except:
                    return
            # 프레임 데이터 분할
            frame_data = self.data_buffer[:frame_size]
            self.data_buffer = self.data_buffer[frame_size:]
            # print("수신 프레임 크기 : {} bytes".format(frame_size))
            # loads : 직렬화된 데이터를 역직렬화
            # 역직렬화(de-serialization) : 직렬화된 파일이나 바이트 객체를 원래의 데이터로 복원하는 것
            frame = pickle.loads(frame_data)

            # imdecode : 이미지(프레임) 디코딩
            frame = cv2.imdecode(frame, cv2.IMREAD_COLOR)

            if self.policy_fire==1:
                tframe = self.FireDetector.detect_fire(frame, 320, 0.4, 0.4, self.camid)
            if self.policy_person==1:
                tfream = self.PersonDetector.detect_person(frame, 320, 0.4, 0.4, self.camid, self.policy_person_cnt)

            if self.policy_falldown==1:
                frame = self.FallDownDetector.detect_falldown(frame, self.camid)

            if self.policy_helmet==1:
                tfream = self.HelmetDetector.detect_helmet(frame, 320, 0.4, 0.4, self.camid)

            if self.recording_video_check==True:
                self.out.write(frame)

            ret, frame = cv2.imencode('.jpg', frame)
            self.imagesave = frame
            self.imageFrame = frame.tobytes()

    def capture_picture(self, puser):
        user = puser
        cp = CapturePicture()
        cp.uid = user
        file = ContentFile(self.imagesave)
        ts = time.time()
        timestamp = datetime.datetime.fromtimestamp(ts).strftime('%Y-%m-%d %H:%M:%S')
        file.name = timestamp + '.jpg'
        cp.image = file
        cp.time = timestamp
        cp.camid = self.camid
        cp.save()

    def recording_video(self, puser):
        if self.recording_video_check == False:
            ts = time.time()
            timestamp = datetime.datetime.fromtimestamp(ts).strftime('%Y_%m_%d_%H_%M_%S')
            print(BASE_DIR)
            self.rvfilename = 'media/tempVideoRepository/'+timestamp + '.mp4'
            print(self.rvfilename)
            self.out = cv2.VideoWriter(self.rvfilename, cv2.VideoWriter_fourcc(*'mp4v'), 20, (640, 480))
            self.recording_video_check = True
            self.check_current_recording=True
        else:
            self.recording_video_check = False
            self.out.release()
            self.out = None
            self.check_current_recording=False
            saved_filename = self.rvfilename
            self.rvfilename = None
            user = puser
            rv = RecordingVideo()
            rv.uid = user
            ts = time.time()
            timestamp = datetime.datetime.fromtimestamp(ts).strftime('%Y-%m-%d %H:%M:%S')
            rv.time = timestamp

            savedFile = str(BASE_DIR)+"/"+saved_filename
            newFile = str(BASE_DIR)+"/"+saved_filename+".mp4"
            print(savedFile+" "+newFile)

            try:
                os.system(f"ffmpeg -i {savedFile} -vcodec libx264 {newFile}")
            except Exception as e:
                print(e)

            fp = open(saved_filename+".mp4", 'rb')
            vf = fp.read()
            file = ContentFile(vf)
            file.name = timestamp + '.mp4'
            rv.video = file
            rv.camid = self.camid
            rv.save()
        # if self.recording_video_check == False:
        #     ts = time.time()
        #     timestamp = datetime.datetime.fromtimestamp(ts).strftime('%Y_%m_%d_%H_%M_%S')
        #     self.rvfilename = BASE_DIR+'media/tempVideoRepository/'+timestamp + '.mp4'
        #     print(self.rvfilename)
        #     self.out = cv2.VideoWriter(self.rvfilename, cv2.VideoWriter_fourcc(*'H264'), 20, (640, 480))
        #     self.recording_video_check = True
        #     self.check_current_recording=True
        # else:
        #     self.recording_video_check = False
        #     self.out.release()
        #     self.out = None
        #     self.check_current_recording=False
        #     saved_filename = self.rvfilename
        #     self.rvfilename = None
        #     user = puser
        #     rv = RecordingVideo()
        #     rv.uid = user
        #     ts = time.time()
        #     timestamp = datetime.datetime.fromtimestamp(ts).strftime('%Y-%m-%d %H:%M:%S')
        #     rv.time = timestamp
        #
        #     fp = open(saved_filename, 'rb')
        #     vf = fp.read()
        #     file = ContentFile(vf)
        #     file.name = timestamp + '.mp4'
        #     rv.video = file
        #     rv.camid = self.camid
        #     rv.save()

    def get_frame(self):
        return self.imageFrame

    def disconnet(self):
        self.check = True
        self.client_socket.close()