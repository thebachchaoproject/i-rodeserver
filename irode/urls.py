
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

urlpatterns = patterns('',
	url(r'^admin/', include(admin.site.urls)),
	url(r'^api/', include('api.urls')),
)

