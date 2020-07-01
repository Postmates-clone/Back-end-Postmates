from django.contrib import admin
from .models import (
    Store,
    OpenHour,
    Menu,
    Option,
    Badge,
    OptionCategory,
    MenuCategory)


@admin.register(Store)
class StoresAdmin(admin.ModelAdmin):
    list_display = ['name', 'address']
    list_filter = ['name', 'address']
    search_fields = ['username', 'phone']


@admin.register(Menu, MenuCategory)
class StoresAdmin(admin.ModelAdmin):
    pass


@admin.register(Option, OptionCategory)
class StoresAdmin(admin.ModelAdmin):
    pass


@admin.register(Badge)
class StoresAdmin(admin.ModelAdmin):
    pass


@admin.register(OpenHour)
class StoresAdmin(admin.ModelAdmin):
    pass
