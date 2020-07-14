from rest_framework.generics import ListAPIView, RetrieveAPIView
from .models import Store
from .serializers import FeedSerializer, StoreDetailSerializer
from .filters import FeedFilter


class Feed(ListAPIView):
    """
    Feed API

    ### GET /feed/
    """
    queryset = Store.objects.all()
    serializer_class = FeedSerializer
    filter_class = FeedFilter


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
