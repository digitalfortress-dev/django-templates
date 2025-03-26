from django.urls import path
from rest_framework_simplejwt.views import TokenRefreshView

app_name = "refresh-token"

urlpatterns = [
    path("", TokenRefreshView.as_view(), name="refresh_token"),
]
