from django.contrib import admin
from .models import (
    Store,
    OpenHour,
    Hour,
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


class HoursInline(admin.TabularInline):
    model = Hour
    extra = 1


@admin.register(OpenHour)
class StoresAdmin(admin.ModelAdmin):
    inlines = [HoursInline]
