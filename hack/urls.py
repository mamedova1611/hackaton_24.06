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
    path('businesses/<int:pk>/', BusinessListView.as_view(), name='businesses_list'),
    path('business/<int:pk>/', BusinessDetailView.as_view(), name='business_detail'),
    path('business/create/', create_business, name='business_create'),
    path('business/edit/<int:pk>/', BusinessEditView.as_view(), name='business_edit'),
    # path('business/del/<int:pk>', BusinnessDeleteView.as_view(), name='business_del')
    path('calendar/', CalendarView.as_view(), name='calendar'),
    path('event/new/', create_event, name='event_new'),
    path('event/edit/<int:pk>/', event_details, name='event_edit'),
    path('event/details/<int:pk>', EventEdit.as_view(), name='event-detail'),
    path('event/delete/<int:pk>/', EventEdit.as_view(), name='delete_event'),
    path('report/<int:pk>/', ReportView.as_view(), name='report'),
    # path('export/', export_xls )
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
