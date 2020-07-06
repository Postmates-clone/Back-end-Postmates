from django.db import models
from django.contrib.auth.models import AbstractUser
from stores.models import Store


def profile_img_dir(instance, filename):
    return '/'.join(['avatars', f'{instance.username}-{filename}'])


class User(AbstractUser):
    # uid = models.CharField(
    #     max_length=28, unique=True, primary_key=True, help_text='유저 고유 값 uid')
    username = models.CharField(
        max_length=30, unique=True, help_text='닉네임')
    avatar = models.ImageField(
        upload_to=profile_img_dir, blank=True, help_text='프로필 사진')
    phone = models.CharField(
        max_length=13, help_text='핸드폰 번호', blank=True)
    address = models.TextField(help_text='주소')
    favorites = models.ManyToManyField(
        Store, through='Favorite', related_name='users', help_text='좋아요')

    class Meta:
        verbose_name = '유저'
        verbose_name_plural = '유저'


class Favorite(models.Model):
    user = models.ForeignKey(
        'User', on_delete=models.CASCADE)
    store = models.ForeignKey(
        Store, related_name='favorites', on_delete=models.CASCADE)
    created = models.DateTimeField(auto_now_add=True)

    class Meta:
        verbose_name = '좋아요'
        verbose_name_plural = '좋아요'
