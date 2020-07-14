from rest_framework import serializers

from deliveries.models import Delivery, OrderedMenu
from stores.serializers import OptionSerializer


class OrderedMenuSerializer(serializers.ModelSerializer):
    name = serializers.SerializerMethodField(
        method_name='get_menu_name')
    options = serializers.SerializerMethodField(
        method_name='get_options')

    def get_menu_name(self, obj):
        return obj.menu.name

    def get_options(self, obj):
        options = obj.options
        return OptionSerializer(options, many=True).data

    class Meta:
        model = OrderedMenu
        fields = ['name', 'options']


class DeliverySerializer(serializers.ModelSerializer):
    ordered_menus = serializers.SerializerMethodField(
        method_name='get_ordered_menu')
    url = serializers.CharField(source='store.url')
    store_img = serializers.CharField(source='store.store_img')

    def get_ordered_menu(self, obj):
        items = obj.ordered_menus
        return OrderedMenuSerializer(items, many=True).data

    class Meta:
        model = Delivery
        fields = ['id', 'url', 'store_img', 'total_price', 'ordered_date', 'ordered_menus']
        read_only_fields = ['ordered_dated']
