from django.contrib.gis.db.models.functions import Distance
from django.contrib.gis.geos import Point
from django.contrib.gis.measure import D
from django.db.models import Count
from django_filters import NumberFilter
from django_filters.rest_framework import FilterSet, CharFilter
from .models import Store


class FeedFilter(FilterSet):
    lat = NumberFilter(
        method='order_by_distance', help_text='위도')
    lng = NumberFilter(
        method='order_by_distance', help_text='경도')
    filter = CharFilter(
        method='order_by_category', lookup_expr='exact', help_text='Feed 카테고리')

    def _filter_store(self, *args):
        pnt = Point(
            float(self.data['lat']),
            float(self.data['lng'])
        )
        ret = Store.objects.filter(
            latlng__distance_lt=(pnt, D(km=30))
        ).annotate(
            favorite_counts=Count('favorites'),
            distance=Distance(pnt, 'latlng')
        ).order_by(
            *args
        )

        return ret

    def order_by_category(self, qs, name, value):
        qs_value = {
            'favorite': 'favorites',
            'delivery': 'delivery_fee',
            'time': 'estimated_prep_time'
        }
        if qs_value[value] == 'favorites':
            return self._filter_store('-favorite_counts', 'distance')
        return self._filter_store(qs_value[value])

    def order_by_distance(self, qs, name, value):
        return self._filter_store('distance')

    class Meta:
        model = Store
        fields = ['lat', 'lng', 'filter']
