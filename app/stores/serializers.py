from rest_framework import serializers
from .models import Store, Hour, MenuCategory, Menu, Option, OptionCategory


class FeedSerializer(serializers.ModelSerializer):
    badges = serializers.StringRelatedField(many=True)

    class Meta:
        model = Store
        fields = (
            'url',
            'name',
            'store_img',
            'delivery_message',
            'delivery_fee',
            'estimated_prep_time',
            'is_partner',
            'food_type',
            'favorite_count',
            'badges'
        )


class OptionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Option
        fields = ['name', 'price']


class OptionCategorySerializer(serializers.ModelSerializer):
    category = serializers.CharField(source='name')
    options = serializers.SerializerMethodField(method_name='get_options')

    def get_options(self, obj):
        option_queryset = obj.options
        return OptionSerializer(option_queryset, many=True).data

    class Meta:
        model = OptionCategory
        fields = ['category', 'is_required', 'options']


class MenuSerializer(serializers.ModelSerializer):
    option_groups = serializers.SerializerMethodField(method_name='get_options')

    def get_options(self, obj):
        option_category_queryset = obj.option_categories
        return OptionCategorySerializer(option_category_queryset, many=True).data

    class Meta:
        model = Menu
        fields = ['name', 'description', 'image_url', 'price', 'option_groups']


class MenuCategorySerializer(serializers.ModelSerializer):
    category = serializers.CharField(source='name')
    menus = serializers.SerializerMethodField(method_name='get_menus')

    def get_menus(self, obj):
        menu_queryset = obj.menu
        return MenuSerializer(menu_queryset, many=True).data

    class Meta:
        model = MenuCategory
        fields = ['category', 'menus']


class HoursSerializer(serializers.ModelSerializer):
    class Meta:
        model = Hour
        fields = ['start', 'end', 'day']


class StoreDetailSerializer(serializers.ModelSerializer):
    badges = serializers.StringRelatedField(many=True)
    open_hours = serializers.SerializerMethodField(method_name='get_hours')
    all_menus = serializers.SerializerMethodField(method_name='get_all_menus')

    def get_hours(self, obj):
        hours_queryset = obj.open_hour.hours
        return HoursSerializer(hours_queryset, many=True).data

    def get_all_menus(self, obj):
        menus_queryset = obj.menu_categories
        return MenuCategorySerializer(menus_queryset, many=True).data

    class Meta:
        model = Store
        fields = (
            'url',
            'name',
            'description',
            'store_img',
            'delivery_message',
            'last_order_time',
            'badges',
            'open_hours',
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
            'all_menus',
        )
