from django.contrib.gis.db.models.functions import Distance
from django.contrib.gis.geos import Point
from django.contrib.gis.measure import D
from django.db.models import Count
from django_filters import NumberFilter
from django_filters.rest_framework import FilterSet, CharFilter
from .models import Store


class InitialFeedFilter(FilterSet):
    search = CharFilter(
        method='search_city', lookup_expr='exact', help_text='도시 검색')
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

    def search_city(self, qs, name, value):
        return Store.objects.filter(city__exact=value)

    class Meta:
        model = Store
        fields = ['category']


class NearbyFilter(FilterSet):
    lat = NumberFilter(
        method='order_by_distance', help_text='위도')
    lng = NumberFilter(
        method='order_by_distance', help_text='경도')

    def order_by_distance(self, qs, name, value):
        pnt = Point(
            float(self.data['lat']),
            float(self.data['lng']))
        ret = Store.objects.filter(
            latlng__distance_lt=(pnt, D(km=50)),
        ).annotate(distance=Distance(pnt, 'latlng')).order_by('distance')

        return ret

    class Meta:
        model = Store
        fields = ['lat', 'lng']
