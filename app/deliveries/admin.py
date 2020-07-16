from django.contrib import admin

from deliveries.models import Delivery, OrderedMenu


class ItemsInline(admin.TabularInline):
    model = OrderedMenu
    fields = []
    extra = 0


@admin.register(Delivery)
class DeliveryAdmin(admin.ModelAdmin):
    inlines = [ItemsInline]
    list_display = ['id', 'user', 'store', 'ordered_date']

    def store(self, obj):
        return obj.store.url

    def username(self, obj):
        return obj.user.username
