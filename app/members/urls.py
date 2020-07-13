from django.urls import path
from rest_framework_jwt.views import verify_jwt_token, refresh_jwt_token

from members.views import UserInfo, UserSignUp, GetJWT

urlpatterns = [
    path('', UserSignUp.as_view()),
    path('<int:id>/', UserInfo.as_view({
        'get': 'retrieve',
        'patch': 'partial_update',
        'delete': 'destroy'
    })),
    path('login/', GetJWT.as_view()),
    path('token/verify/', verify_jwt_token),
    path('token/refresh/', refresh_jwt_token),
]
