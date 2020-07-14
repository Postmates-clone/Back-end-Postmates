from django.contrib import admin

from deliveries.models import Delivery, OrderedMenu


@admin.register(Delivery)
class DeliveryAdmin(admin.ModelAdmin):
    pass


@admin.register(OrderedMenu)
class DeliveryAdmin(admin.ModelAdmin):
    pass
