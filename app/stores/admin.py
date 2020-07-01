from django.contrib import admin
from .models import Store, OpenHour, Menu, Option


@admin.register(Store)
class MembersAdmin(admin.ModelAdmin):
    list_display = ['name', 'address']
    list_filter = ['name', 'address']
    search_fields = ['username', 'phone']


@admin.register(Menu)
class MembersAdmin(admin.ModelAdmin):
    pass


@admin.register(Option)
class MembersAdmin(admin.ModelAdmin):
    pass
