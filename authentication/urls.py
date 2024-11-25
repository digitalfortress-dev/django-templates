from django.urls import path
from rest_framework_simplejwt.views import TokenObtainPairView

from authentication.views import RegistrationAPIView

app_name = "auth"

urlpatterns = [
    path("auth/register", RegistrationAPIView.as_view(), name="register"),
    path("auth/login", TokenObtainPairView.as_view(), name="login"),
]
