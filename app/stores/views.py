from rest_framework.generics import ListAPIView
from .models import Store
from .serializers import FeedSerializer
from .filters import InitialFeedFilter, NearbyFilter


class InitialFeed(ListAPIView):
    """
    Feed 카테고리별 API

    ### GET /feed/
    """
    queryset = Store.objects.all()
    serializer_class = FeedSerializer
    filter_class = InitialFeedFilter


class NearbyFeed(ListAPIView):
    """
    Feed 거리순 API

    ### GET /feed/
    """
    queryset = Store.objects.all()
    serializer_class = FeedSerializer
    filter_class = NearbyFilter
