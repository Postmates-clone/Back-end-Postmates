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


@admin.register(MenuCategory)
class StoresAdmin(admin.ModelAdmin):
    pass


@admin.register(Menu)
class StoresAdmin(admin.ModelAdmin):
    list_display = ['id', 'name', 'menu_category', 'store']
    search_fields = ['name', 'menu_categories__name', 'menu_categories__store__name']
    list_display_links = ['name']

    def menu_category(self, obj):
        all_mc = [mc.name for mc in obj.menu_categories.all()]
        return ' '.join(all_mc)

    def store(self, obj):
        store = [mc.store.url for mc in obj.menu_categories.all()]
        return ' '.join(store)


@admin.register(Option, OptionCategory)
class StoresAdmin(admin.ModelAdmin):
    pass


class HoursInline(admin.TabularInline):
    model = Hour
    extra = 1


@admin.register(OpenHour)
class StoresAdmin(admin.ModelAdmin):
    inlines = [HoursInline]
