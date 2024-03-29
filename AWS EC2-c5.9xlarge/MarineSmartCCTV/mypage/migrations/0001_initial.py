# Generated by Django 3.1.3 on 2022-08-25 14:40

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Weather',
            fields=[
                ('reg_time', models.DateField(primary_key=True, serialize=False)),
                ('port', models.CharField(blank=True, max_length=45, null=True)),
                ('pty', models.CharField(blank=True, max_length=45, null=True)),
                ('sky', models.CharField(blank=True, max_length=45, null=True)),
                ('vec', models.IntegerField(blank=True, null=True)),
                ('wsd', models.IntegerField(blank=True, null=True)),
                ('t1h', models.IntegerField(blank=True, null=True)),
            ],
            options={
                'db_table': 'weather',
                'managed': False,
            },
        ),
    ]
