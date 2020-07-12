from django.contrib import admin
from .models import User, Favorite


@admin.register(User)
class MembersAdmin(admin.ModelAdmin):
    list_display = ['id', 'username', 'phone', 'is_staff', 'favorite_count']
    fields = ['username', 'password', 'address', 'email', 'phone']
    list_display_links = ['username']

    def favorite_count(self, obj):
        return obj.favorites.count()


@admin.register(Favorite)
class MembersAdmin(admin.ModelAdmin):
    pass
