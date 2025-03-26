from django.urls import path
from rest_framework_simplejwt.views import TokenObtainPairView

from apps.authentication.views import RegistrationAPIView

app_name = "auth"

urlpatterns = [
    path("register", RegistrationAPIView.as_view(), name="register"),
    path("login", TokenObtainPairView.as_view(), name="login"),
]
