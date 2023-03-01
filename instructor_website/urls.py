from django.contrib import admin
from django.contrib.staticfiles.storage import staticfiles_storage
from django.urls import path, include
from django.views.generic import RedirectView

from . import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('instructor_website.apps.public.urls')),
    path('accounts/', include('instructor_website.apps.accounts.urls')),
    path("contact/", include("instructor_website.apps.contact.urls")),
    path(
        "favicon.ico",
        RedirectView.as_view(url=staticfiles_storage.url("favicon.ico")),
    ),
]
