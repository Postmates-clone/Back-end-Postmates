from django.contrib.auth import get_user_model
from django.db import models

from stores.models import Menu, Option, Store

User = get_user_model()


class Delivery(models.Model):
    user = models.ForeignKey(
        User, on_delete=models.CASCADE, related_name='deliveries')
    store = models.ForeignKey(
        Store, on_delete=models.PROTECT, related_name='deliveries')
    ordered_date = models.DateTimeField(
        auto_now_add=True)
    total_price = models.FloatField()
    items = models.ManyToManyField(
        Menu, through='OrderedMenu', related_name='delivery')


class OrderedMenu(models.Model):
    menu = models.ForeignKey(
        Menu, on_delete=models.PROTECT, related_name='ordered_menus')
    delivery = models.ForeignKey(
        'Delivery', on_delete=models.CASCADE, related_name='ordered_menus')
    options = models.ManyToManyField(Option, related_name='ordered_menus')
