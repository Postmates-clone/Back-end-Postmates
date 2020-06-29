from django.contrib.auth import get_user_model
from rest_framework import serializers

User = get_user_model()


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        fields = [
            'uid',
            'username',
            'phone',
            'avatar',
        ]
        model = User
