from rest_framework.permissions import IsAuthenticated
from rest_framework.viewsets import ModelViewSet

from deliveries.models import Delivery as DeliveryModel
from deliveries.serializers import DeliverySerializer
from stores.models import Store


class Delivery(ModelViewSet):
    queryset = DeliveryModel.objects.all()
    serializer_class = DeliverySerializer
    permission_classes = (IsAuthenticated,)

    def perform_create(self, serializer):
        store = Store.objects.get(url=self.request.data.pop('url'))
        serializer.save(
            user=self.request.user,
            store=store
        )