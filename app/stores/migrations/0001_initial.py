# Generated by Django 3.0.8 on 2020-07-13 01:46

import django.contrib.gis.db.models.fields
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Badge',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('text', models.TextField(help_text='가게 특이사항', unique=True)),
            ],
            options={
                'verbose_name': '가게 뱃지',
                'verbose_name_plural': '가게 뱃지',
            },
        ),
        migrations.CreateModel(
            name='Menu',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.TextField(help_text='음식 이름')),
                ('description', models.TextField(blank=True, help_text='음식 설명', null=True)),
                ('price', models.FloatField(blank=True, help_text='음식 가격', null=True)),
                ('image_url', models.TextField(blank=True, help_text='음식 대표 이미지', null=True)),
            ],
            options={
                'verbose_name': '메뉴',
                'verbose_name_plural': '메뉴',
            },
        ),
        migrations.CreateModel(
            name='Store',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('url', models.TextField(help_text='가게 url', max_length=100, unique=True)),
                ('name', models.TextField(help_text='가게 이름', max_length=50)),
                ('description', models.TextField(help_text='가게 설명')),
                ('delivery_message', models.TextField(blank=True, help_text='주문 가능 메세지', null=True)),
                ('last_order_time', models.FloatField(blank=True, help_text='라스트 오더 시간', null=True)),
                ('is_delivery', models.BooleanField(help_text='배달 여부')),
                ('is_pickup', models.BooleanField(blank=True, help_text='테이크아웃 여부', null=True)),
                ('delivery_fee', models.FloatField(help_text='배달 비')),
                ('estimated_prep_time', models.IntegerField(blank=True, help_text='예상 준비 시간', null=True)),
                ('is_partner', models.BooleanField(blank=True, help_text='파트너인지 여부', null=True)),
                ('store_img', models.TextField(blank=True, help_text='썸네일 이미지', null=True)),
                ('address', models.TextField(help_text='가게 주소')),
                ('lat', models.FloatField(help_text='위도')),
                ('lng', models.FloatField(help_text='경도')),
                ('latlng', django.contrib.gis.db.models.fields.PointField(blank=True, help_text='위도 경도 좌표 객체', null=True, srid=4326)),
                ('food_type', models.TextField(help_text='가게 요리 분류')),
                ('city', models.TextField(help_text='도시')),
                ('badges', models.ManyToManyField(blank=True, related_name='stores', to='stores.Badge')),
            ],
            options={
                'verbose_name': '가게',
                'verbose_name_plural': '가게',
            },
        ),
        migrations.CreateModel(
            name='OptionCategory',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.TextField(help_text='옵션 카테고리 이름', unique=True)),
                ('is_required', models.BooleanField(help_text='필수 선택 여부')),
                ('option_category', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='child_option_categories', to='stores.OptionCategory')),
            ],
            options={
                'verbose_name': '옵션 카테고리',
                'verbose_name_plural': '옵션 카테고리',
            },
        ),
        migrations.CreateModel(
            name='Option',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.TextField(help_text='옵션 이름')),
                ('price', models.FloatField(help_text='옵션 가격')),
                ('category', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='options', to='stores.OptionCategory')),
            ],
            options={
                'verbose_name': '옵션',
                'verbose_name_plural': '옵션',
            },
        ),
        migrations.CreateModel(
            name='OpenHour',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('store', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, related_name='open_hour', to='stores.Store')),
            ],
            options={
                'verbose_name': '가게 오픈 시간',
                'verbose_name_plural': '가게 오픈 시간',
            },
        ),
        migrations.CreateModel(
            name='MenuCategory',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.TextField(help_text='메뉴 카테고리')),
                ('menu', models.ManyToManyField(related_name='menu_categories', to='stores.Menu')),
                ('store', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='menu_categories', to='stores.Store')),
            ],
            options={
                'verbose_name': '메뉴 카테고리',
                'verbose_name_plural': '메뉴 카테고리',
            },
        ),
        migrations.AddField(
            model_name='menu',
            name='option_categories',
            field=models.ManyToManyField(help_text='옵션 카테고리', to='stores.OptionCategory'),
        ),
        migrations.CreateModel(
            name='Hour',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('start', models.TextField(help_text='시작 시간')),
                ('end', models.TextField(help_text='마감 시간')),
                ('day', models.IntegerField(help_text='요일')),
                ('open_hour', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='hours', to='stores.OpenHour')),
            ],
            options={
                'verbose_name': '가게  요일별 오픈 시간',
                'verbose_name_plural': '가게 요일별 오픈 시간',
            },
        ),
    ]
