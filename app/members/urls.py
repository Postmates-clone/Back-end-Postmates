from django.urls import path, include
from rest_framework.routers import DefaultRouter

from members.views import UserInfo

router = DefaultRouter()
router.register(r'', UserInfo)

urlpatterns = [
    path('', include(router.urls)),
]
