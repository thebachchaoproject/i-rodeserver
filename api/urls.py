
##############################################
#                                            #
#           Developer: Shreesha S            #
#     Contact: shreesha.suresh@gmail.com     #
#               Version 1.0                  #
#                                            #
##############################################

from django.conf.urls import patterns, include, url
from django.conf import settings
from django.contrib import admin
from api import views

urlpatterns = patterns('',
	url(r'^addinfo/$', views.addInformation, name='add information'),
	url(r'^getinfo/$', views.getInformation, name='get information'),
	url(r'^getrating/$', views.getRating, name='get rating'),
	url(r'^showinfo/$', views.showInformation, name='show trip information'),
)
