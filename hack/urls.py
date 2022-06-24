from django.conf import settings
from django.conf.urls.static import static
from django.urls import path
from .views import *

urlpatterns = [
    path('login/', UserLoginView.as_view(), name='login'),
    path('logout', UserLogoutView.as_view(), name='logout'),
    path('register/', register_view, name='register'),
    path('profile/<int:pk>/', ProfileDetailView.as_view(), name='profile'),
    path('profile/edit/<int:pk>/', ProfileEditFormView.as_view(), name='profile_edit'),
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
