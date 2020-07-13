from datetime import datetime

from django.contrib.auth import get_user_model
from rest_framework import status
from rest_framework.generics import CreateAPIView
from rest_framework.permissions import IsAuthenticated, AllowAny
from rest_framework.response import Response
from rest_framework.settings import api_settings
from rest_framework.viewsets import ModelViewSet
from rest_framework_jwt.views import JSONWebTokenAPIView, jwt_response_payload_handler

from .serializers import UserSerializer, JWTSerializer

User = get_user_model()


class UserInfo(ModelViewSet):
    queryset = User.objects.all()
    serializer_class = UserSerializer
    permission_classes = (IsAuthenticated,)

    def get_object(self):
        queryset = self.get_queryset()
        user = queryset.get(id=self.kwargs['id'])
        return user


class GetJWT(JSONWebTokenAPIView):
    serializer_class = JWTSerializer

    def post(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)

        if serializer.is_valid():
            user = serializer.data.get('user') or request.user
            token = serializer.data.get('token')
            response_data = jwt_response_payload_handler(token, user, request)
            response = Response(response_data)

            return response

        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class UserSignUp(CreateAPIView):
    queryset = User.objects.all()
    serializer_class = UserSerializer

