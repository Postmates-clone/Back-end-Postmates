from rest_framework.generics import ListAPIView, RetrieveAPIView
from .models import Store
from .serializers import FeedSerializer, StoreDetailSerializer
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


class StoreDetail(RetrieveAPIView):
    """
    Store page API

    ### GET /store/<str: store_name>
    """
    queryset = Store.objects.all()
    serializer_class = StoreDetailSerializer

    def get_object(self):
        queryset = self.get_queryset()
        store = queryset.get(url=self.kwargs['store_url'])
        return store