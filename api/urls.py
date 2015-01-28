
#############################################################
#                                                           #
#                   Developer: Shreesha S                   #
#          Contact: theteam@thebachchaoproject.org          #
#                        Version 1.0                        #
#          Copyright (c) 2015 The Bachchao Project          #
#                                                           #
#############################################################

from django.conf.urls import patterns, include, url
from django.conf import settings
from django.contrib import admin
from api import views

urlpatterns = patterns('',
	url(r'^addinfo/$', views.addInformation, name='add_information'),
	url(r'^getinfo/$', views.getInformation, name='get_information'),
	url(r'^getrating/$', views.getRating, name='get_rating'),
	url(r'^showinfo/$', views.showInformation, name='show_trip_information'),
)
