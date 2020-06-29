from django.contrib import admin
from .models import User


@admin.register(User)
class MembersAdmin(admin.ModelAdmin):
    list_display = ['uid', 'username', 'phone']
