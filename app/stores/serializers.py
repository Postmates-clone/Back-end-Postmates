from rest_framework import serializers
from .models import Store, OpenHour, Menu, Option


class FeedSerializer(serializers.ModelSerializer):
    badges = serializers.StringRelatedField(many=True)

    class Meta:
        model = Store
        fields = (
            'url',
            'name',
            'store_img',
            'delivery_time',
            'delivery_fee',
            'estimated_prep_time',
            'is_partner',
            'food_type',
            'favorite_count',
            'badges',
        )


class OpenHourSerializer(serializers.ModelSerializer):
    class Meta:
        model = OpenHour
        fields = (
            'monday',
            'tuesday',
            'wednesday',
            'thursday',
            'friday',
            'saturday',

        )


class OptionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Option
        fields = (
            'name',
            'option_price',
        )


class MenuSerializer(serializers.ModelSerializer):
    options = OptionSerializer(many=True)

    class Meta:
        model = Menu
        fields = (
            'name',
            'description',
            'image_url',
            'base_price',
            'options',
        )


class StoreSerializer(serializers.ModelSerializer):
    open_hour = serializers.StringRelatedField()
    menus = MenuSerializer(many=True)

    class Meta:
        model = Store
        fields = (
            'name',
            'description',
            'store_img',
            'delivery_time',
            'is_delivery',
            'is_pickup',
            'delivery_fee',
            'estimated_prep_time',
            'is_partner',
            'address',
            'lat',
            'lng',
            'food_type',
            'city',
            'badges',
            'menus',
            'open_hour',
        )
