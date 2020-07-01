from django.db.models import Count
from django_filters.rest_framework import FilterSet, CharFilter
from .models import Store


class InitialFeedFilter(FilterSet):
    category = CharFilter(
        method='order_by_category', lookup_expr='exact', help_text='Feed 카테고리')

    def order_by_category(self, qs, name, value):
        qs_value = {
            'favorite': 'favorites',
            'delivery': 'delivery_fee',
            'time': 'estimated_prep_time'
        }
        if qs_value[value] == 'favorites':
            return Store.objects.annotate(favorite_counts=Count('favorites')).order_by('favorite_counts')
        return Store.objects.order_by(qs_value[value])

    class Meta:
        model = Store
        fields = ['category']
