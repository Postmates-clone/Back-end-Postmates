from rest_framework.generics import ListAPIView
from .models import Store
from .serializers import InitialFeedSerializer
from .filters import InitialFeedFilter


class InitialFeed(ListAPIView):
    """
    Feed 카테고리별 API

    ### GET /feed/
    """
    queryset = Store.objects.all()
    serializer_class = InitialFeedSerializer
    filter_class = InitialFeedFilter
