
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

urlpatterns = patterns('',
	url(r'^admin/', include(admin.site.urls)),
	url(r'^api/', include('api.urls')),
)

