from django.urls import path

from .views import StoreDetail, Feed

app_name = 'stores'
urlpatterns = [
    path('feed/', Feed.as_view()),
    path('store/<str:store_url>/', StoreDetail.as_view()),
]
