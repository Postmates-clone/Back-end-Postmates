from rest_framework import serializers

from deliveries.models import Delivery, OrderedMenu
from stores.models import Menu, Option
from stores.serializers import OptionSerializer


class OrderedMenuSerializer(serializers.ModelSerializer):
    id = serializers.IntegerField(source='menu.id')
    name = serializers.CharField(source='menu.name')
    options = serializers.SerializerMethodField(
        method_name='get_options')

    def get_options(self, obj):
        options = obj.options
        return OptionSerializer(options, many=True).data

    class Meta:
        model = OrderedMenu
        fields = ['id', 'name', 'options']


class DeliverySerializer(serializers.ModelSerializer):
    ordered_menus = serializers.SerializerMethodField(
        method_name='get_ordered_menu')
    url = serializers.CharField(source='store.url')
    store_img = serializers.CharField(source='store.store_img', read_only=True)

    def create(self, validated_data):
        delivery = super(DeliverySerializer, self).create(validated_data)
        for item in self.initial_data.pop('ordered_menus'):
            menu = Menu.objects.get(id=item['id'])
            ordered_menu = OrderedMenu.objects.create(menu=menu, delivery=delivery)
            for option in item['options']:
                ordered_menu.options.add(
                    Option.objects.get(name=option['name'])
                )
        return delivery

    def get_ordered_menu(self, obj):
        items = obj.ordered_menus
        return OrderedMenuSerializer(items, many=True).data

    class Meta:
        model = Delivery
        fields = ['id', 'url', 'store_img', 'total_price', 'ordered_date', 'ordered_menus']
        read_only_fields = ['ordered_dated', 'store_img']
