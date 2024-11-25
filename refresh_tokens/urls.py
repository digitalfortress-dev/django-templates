from django.urls import path
from rest_framework_simplejwt.views import TokenRefreshView

app_name = "refresh-token"

urlpatterns = [
    path("auth/refresh-token", TokenRefreshView.as_view(), name="refresh_token"),
]
