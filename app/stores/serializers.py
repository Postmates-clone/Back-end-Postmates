from rest_framework import serializers
from .models import Store


class InitialFeedSerializer(serializers.ModelSerializer):
    badges = serializers.StringRelatedField(many=True)

    class Meta:
        model = Store
        fields = (
            'url',
            'name',
            'store_img',
            'delivery_time',
            'delivery_fee',
            'estimated_prep_time',
            'is_partner',
            'food_type',
            'favorite_count',
            'badges'
        )
