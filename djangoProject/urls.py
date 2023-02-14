"""djangoProject URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from . import views
from prometheus_client import multiprocess
from prometheus_client import CONTENT_TYPE_LATEST
from django.http import HttpResponse


def metrics(request):
    data = multiprocess.get_stats_for_all_processes()
    return HttpResponse(content=data, content_type=CONTENT_TYPE_LATEST)


urlpatterns = [
    path('', views.helloWorld, name='helloWorld'),
    path('admin/', admin.site.urls),
    path('metrics/', metrics),
]
