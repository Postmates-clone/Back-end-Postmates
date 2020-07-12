from django.contrib.auth import get_user_model
from rest_framework import serializers

User = get_user_model()


class UserSerializer(serializers.ModelSerializer):

    def create(self, validated_data):
        user = super(UserSerializer, self).create(validated_data)
        user.set_password(validated_data['password'])
        user.save()
        return user

    class Meta:
        model = User
        fields = [
            'id',
            'username',
            'password',
            'phone',
            'email',
            'address'
        ]
        read_only_fields = ['id']
        extra_kwargs = {'password': {'write_only': True}}
