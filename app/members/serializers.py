from django.contrib.auth import get_user_model, authenticate
from django.utils.translation import ugettext as _
from rest_framework import serializers
from rest_framework.serializers import Serializer, CharField
from rest_framework_jwt.compat import PasswordField
from rest_framework_jwt.serializers import jwt_payload_handler, jwt_encode_handler

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


class JWTSerializer(Serializer):
    email = serializers.EmailField()
    password = serializers.CharField()

    def validate(self, attrs):
        credentials = {
            'email': attrs.get('email'),
            'password': attrs.get('password')
        }

        if all(credentials.values()):
            user = authenticate(**credentials)

            if user:
                if not user.is_active:
                    msg = _('User account is disabled.')
                    raise serializers.ValidationError(msg)

                payload = jwt_payload_handler(user)

                return {
                    'token': jwt_encode_handler(payload),
                    'user': user
                }
            else:
                msg = _('Unable to log in with provided credentials.')
                raise serializers.ValidationError(msg)
        else:
            msg = _('Must include "{email_field}" and "password".')
            msg = msg.format(email_field='email')
            raise serializers.ValidationError(msg)

    def to_representation(self, instance):
        return instance