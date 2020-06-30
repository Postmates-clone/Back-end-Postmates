from django.db import models

BADGE_CHOICES = [
    ('NEW', '신상'),
    ('POPULAR', '인기'),
]

STATE_CHOICES = [
    ('open', '판매중'),
    ('close', '판매종료'),
]

FOOD_TYPES_CHOICES = [
    ('korean', '한식'),
    ('chinese', '중식'),
    ('japanese', '일식'),
]


def store_img_dir(instance, filename):
    return '/'.join(['store', f'{instance.name}-{filename}'])


class Store(models.Model):
    name = models.CharField(
        max_length=30, help_text='가게 이름')
    description = models.TextField(
        help_text='가게 설명')
    delivery = models.BooleanField(
        help_text='배달 여부')
    pickup = models.BooleanField(
        help_text='테이크아웃 여부')
    delivery_price = models.IntegerField(
        help_text='배달 비')
    estimated_prep_time = models.IntegerField(
        help_text='예상 준비 시간')
    is_partner = models.BooleanField(
        help_text='파트너인지 여부')
    thumb_image = models.ImageField(
        upload_to=store_img_dir, help_text='썸네일 이미지', null=True, blank=True)
    state = models.CharField(
        choices=STATE_CHOICES, max_length=5, help_text='판매 여부')
    address = models.CharField(
        max_length=50, help_text='가게 주소')
    lat = models.FloatField(
        help_text='위도')
    lng = models.FloatField(
        help_text='경도')
    badge = models.CharField(
        choices=BADGE_CHOICES, max_length=7, help_text='가게 특징')
    food_type = models.CharField(
        choices=FOOD_TYPES_CHOICES, max_length=10, help_text='가게 요리 분류')

    class Meta:
        verbose_name = '가게'
        verbose_name_plural = '가게'


class DailyOpenTime(models.Model):
    store = models.ForeignKey(
        'Store', on_delete=models.CASCADE, related_name='daily_opens')
    Monday = models.CharField(
        max_length=30, help_text='월요일')
    Tuesday = models.CharField(
        max_length=30, help_text='화요일')
    Wednesday = models.CharField(
        max_length=30, help_text='수요일')
    Thursday = models.CharField(
        max_length=30, help_text='목요일')
    Friday = models.CharField(
        max_length=30, help_text='금요일')
    Saturday = models.CharField(
        max_length=30, help_text='토요일')
    Sunday = models.CharField(
        max_length=30, help_text='일요일')

    class Meta:
        verbose_name = '가게 오픈 시간'
        verbose_name_plural = '가게 오픈 시간'


def food_img_dir(instance, filename):
    return '/'.join(['store/food', f'{instance.name}-{filename}'])


class Menu(models.Model):
    store = models.ForeignKey(
        'Store', on_delete=models.CASCADE, related_name='menus')
    name = models.CharField(
        max_length=50, help_text='음식 이름')
    description = models.TextField(
        help_text='음식 설명')
    price = models.IntegerField(
        help_text='음식 가격')
    image = models.ImageField(
        upload_to=food_img_dir, help_text='음식 대표 이미지')

    class Meta:
        verbose_name = '음식 메뉴'
        verbose_name_plural = '음식 메뉴'


class Topping(models.Model):
    food = models.ForeignKey(
        'Menu', on_delete=models.CASCADE, related_name='toppings')
    category = models.CharField(
        max_length=50, help_text='토핑 카테고리')
    name = models.CharField(
        max_length=30, help_text='토핑 이름')
    parent_topping = models.ForeignKey(
        'self', on_delete=models.CASCADE, null=True)

    class Meta:
        verbose_name = '토핑'
        verbose_name_plural = '토핑'
