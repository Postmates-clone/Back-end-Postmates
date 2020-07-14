from rest_framework.permissions import IsAuthenticated
from rest_framework.viewsets import ModelViewSet

from deliveries.models import Delivery as DeliveryModel
from deliveries.serializers import DeliverySerializer


class Delivery(ModelViewSet):
    queryset = DeliveryModel.objects.all()
    serializer_class = DeliverySerializer
    permission_classes = (IsAuthenticated,)

    def perform_create(self, serializer):
        serializer.save(user=self.request.user)