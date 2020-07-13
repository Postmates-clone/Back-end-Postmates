from django.urls import path
from rest_framework_jwt.views import verify_jwt_token, refresh_jwt_token

from members.views import UserInfo, UserSignUp, GetJWT

urlpatterns = [
    path('', UserInfo.as_view({
        'get': 'retrieve',
        'patch': 'partial_update',
        'delete': 'destroy'
    })),
    path('signup/', UserSignUp.as_view()),
    path('login/', GetJWT.as_view()),
    path('token/verify/', verify_jwt_token),
    path('token/refresh/', refresh_jwt_token),
]
