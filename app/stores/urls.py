from django.urls import path

from .views import InitialFeed, NearbyFeed, StoreDetail

app_name = 'stores'
urlpatterns = [
    path('feed/', InitialFeed.as_view()),
    path('feed/nearby/', NearbyFeed.as_view()),
    path('store/<str:store_url>/', StoreDetail.as_view()),
]
