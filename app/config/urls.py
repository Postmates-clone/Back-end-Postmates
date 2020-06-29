from django.contrib import admin
from django.urls import path, include


apps_urlpatterns = [
    path('members/', include('members.urls')),
]

urlpatterns = [
    path('api/v1/', include(apps_urlpatterns)),
    path('admin/', admin.site.urls),
]
