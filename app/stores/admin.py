from django.contrib import admin
from .models import Store, DailyOpenTime, Menu, Topping


@admin.register(Store)
class MembersAdmin(admin.ModelAdmin):
    list_display = ['name', 'address']
    list_filter = ['name', 'address']
    search_fields = ['username', 'phone']


@admin.register(Menu)
class MembersAdmin(admin.ModelAdmin):
    pass


@admin.register(Topping)
class MembersAdmin(admin.ModelAdmin):
    pass
