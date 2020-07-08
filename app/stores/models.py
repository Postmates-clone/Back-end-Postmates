from django.contrib.gis.geos import Point
from django.contrib.gis.db import models

FOOD_TYPES_CHOICES = [
    ('korean', '한식'),
    ('chinese', '중식'),
    ('japanese', '일식'),
]


def store_img_dir(instance, filename):
    return '/'.join(['store', f'{instance.name}-{filename}'])


class Store(models.Model):
    url = models.CharField(
        max_length=100, unique=True, help_text='가게 url')
    name = models.CharField(
        max_length=30, help_text='가게 이름')
    description = models.TextField(
        help_text='가게 설명')
    delivery_time = models.CharField(
        max_length=30, help_text='주문 가능 시간')
    is_delivery = models.BooleanField(
        help_text='배달 여부')
    is_pickup = models.BooleanField(
        help_text='테이크아웃 여부')
    delivery_fee = models.IntegerField(
        help_text='배달 비')
    estimated_prep_time = models.IntegerField(
        help_text='예상 준비 시간')
    is_partner = models.BooleanField(
        help_text='파트너인지 여부')
    store_img = models.ImageField(
        upload_to=store_img_dir, help_text='썸네일 이미지', null=True, blank=True)
    address = models.CharField(
        max_length=50, help_text='가게 주소')
    lat = models.FloatField(
        help_text='위도')
    lng = models.FloatField(
        help_text='경도')
    latlng = models.PointField(
        null=True, blank=True, help_text='위도 경도 좌표 객체')
    food_type = models.CharField(
        choices=FOOD_TYPES_CHOICES, max_length=10, help_text='가게 요리 분류')
    city = models.CharField(
        max_length=30, help_text='도시')
    badges = models.ManyToManyField(
        'Badge', blank=True, related_name='stores')

    @property
    def favorite_count(self):
        return self.favorites.count()

    def __str__(self):
        return self.name

    def save(self, *args, **kwargs):
        self.latlng = Point(self.lat, self.lng)
        return super(Store, self).save(*args, **kwargs)

    class Meta:
        verbose_name = '가게'
        verbose_name_plural = '가게'

    class Meta:
        verbose_name = '가게'
        verbose_name_plural = '가게'


class Badge(models.Model):
    text = models.CharField(
        max_length=30, help_text='가게 특이사항')

    def __str__(self):
        return self.text

    class Meta:
        verbose_name = '가게 뱃지'
        verbose_name_plural = '가게 뱃지'


class OpenHour(models.Model):
    store = models.OneToOneField(
        'Store', on_delete=models.CASCADE, related_name='open_hour')

    def __str__(self):
        return f'{self.store.name}의 가게 오픈 시간'

    class Meta:
        verbose_name = '가게 오픈 시간'
        verbose_name_plural = '가게 오픈 시간'


class Hour(models.Model):
    open_hour = models.ForeignKey(
        'OpenHour', on_delete=models.CASCADE, related_name='hours')
    start = models.CharField(
        max_length=5, help_text='시작 시간')
    end = models.CharField(
        max_length=5, help_text='마감 시간')
    day = models.IntegerField(
        help_text='요일')

    def __str__(self):
        return f'Day {self.day} - Open : {self.start}, Close : {self.end}'

    class Meta:
        verbose_name = '요일별 오픈 시간'
        verbose_name_plural = '요일별 오픈 시간'


def food_img_dir(instance, filename):
    return '/'.join(['store/food', f'{instance.name}-{filename}'])


class MenuCategory(models.Model):
    store = models.ForeignKey('Store', on_delete=models.CASCADE)
    menu = models.ManyToManyField('Menu', related_name='menu_categories')
    name = models.CharField(max_length=50, help_text='메뉴 카테고리')

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = '메뉴 카테고리'
        verbose_name_plural = '메뉴 카테고리'


class Menu(models.Model):
    name = models.CharField(
        max_length=50, help_text='음식 이름')
    description = models.TextField(
        help_text='음식 설명')
    price = models.FloatField(
        help_text='음식 가격')
    image_url = models.TextField(
        help_text='음식 대표 이미지')
    option_categories = models.ManyToManyField(
        'OptionCategory', help_text='옵션 카테고리')

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = '메뉴'
        verbose_name_plural = '메뉴'


class OptionCategory(models.Model):
    option_category = models.ForeignKey(
        'self', on_delete=models.CASCADE, blank=True, null=True, related_name='child_option_categories')
    name = models.CharField(
        max_length=30, help_text='옵션 카테고리 이름')
    is_required = models.BooleanField(
        help_text='필수 선택 여부')

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = '옵션 카테고리'
        verbose_name_plural = '옵션 카테고리'


class Option(models.Model):
    option_category = models.ForeignKey(
        'OptionCategory', on_delete=models.CASCADE, related_name='options')
    name = models.CharField(
        max_length=50, help_text='옵션 이름')
    option_price = models.IntegerField(
        help_text='옵션 가격')

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = '옵션'
        verbose_name_plural = '옵션'
