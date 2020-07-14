from django.contrib import admin
from .models import (
    Store,
    OpenHour,
    Hour,
    Menu,
    Badge,
    Option,
    OptionCategory,
    MenuCategory
)


@admin.register(Store)
class StoresAdmin(admin.ModelAdmin):
    list_display = ['name', 'address', 'city', 'favorites']
    list_filter = ['city']
    search_fields = ['name', 'address', 'description']

    def favorites(self, obj):
        return obj.favorites.count()


@admin.register(Badge)
class StoresAdmin(admin.ModelAdmin):
    pass


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
