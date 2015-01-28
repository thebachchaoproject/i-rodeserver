
#############################################################
#                                                           #
#                   Developer: Shreesha S                   #
#          Contact: theteam@thebachchaoproject.org          #
#                        Version 1.0                        #
#          Copyright (c) 2015 The Bachchao Project          #
#                                                           #
#############################################################

"""
WSGI config for irode project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/1.7/howto/deployment/wsgi/
"""

import os
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "irode.settings")

from django.core.wsgi import get_wsgi_application
application = get_wsgi_application()
