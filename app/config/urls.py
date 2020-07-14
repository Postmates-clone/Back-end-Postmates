from django.contrib import admin
from django.urls import path, include
from django.conf.urls.static import static
from config.settings import dev

apps_urlpatterns = [
    path('', include('stores.urls')),
    path('members/', include('members.urls')),
    path('deliveries/', include('deliveries.urls')),
]

urlpatterns = [
    path('api/v1/', include(apps_urlpatterns)),
    path('admin/', admin.site.urls),
]

# local media
urlpatterns += static(prefix=dev.MEDIA_URL, document_root=dev.MEDIA_ROOT)
