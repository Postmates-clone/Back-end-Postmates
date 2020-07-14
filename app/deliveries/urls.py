from django.urls import path
from rest_framework import routers

from deliveries.views import Delivery

router = routers.DefaultRouter()
router.register('', Delivery)

urlpatterns = router.urls