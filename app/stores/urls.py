from django.urls import path

from .views import InitialFeed, NearbyFeed

app_name = 'stores'
urlpatterns = [
    path('', InitialFeed.as_view()),
    path('nearby/', NearbyFeed.as_view()),
]