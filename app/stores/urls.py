from django.urls import path

from .views import InitialFeed

app_name = 'stores'
urlpatterns = [
    path('', InitialFeed.as_view()),
]