from django.db import models
from django.contrib.auth.models import AbstractUser


def profile_img_dir(instance, filename):
    return '/'.join(['avatars', f'{instance.username}-{filename}'])


class User(AbstractUser):
    uid = models.CharField(
        max_length=28, unique=True, primary_key=True, help_text='유저 고유 값 uid')
    username = models.CharField(
        max_length=30, unique=True, help_text='닉네임')
    avatar = models.ImageField(
        upload_to=profile_img_dir, blank=True, help_text='프로필 사진')
    phone = models.CharField(
        max_length=13, help_text='핸드폰 번호')
