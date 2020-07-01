from django.contrib import admin
from .models import User


@admin.register(User)
class MembersAdmin(admin.ModelAdmin):
    list_display = ['username', 'phone', 'is_staff', 'favorite_count']
    fields = ['username', 'avatar', 'phone']

    def favorite_count(self, obj):
        return obj.favorites.count()
