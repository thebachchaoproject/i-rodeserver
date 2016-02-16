# i-rodeserver
### A Travel safety API based app for a friend

These instruction were written to install the i-rode server on Ubuntu 14 Trusty Tahr.

## Install Requirements
#### Python 3.4
Python 3.4 generally comes pre-installed on Ubuntu, to confirm that on your install run:
```
$ python3
```
You should see output that says something like:
```
Python 3.4.3 (default, Oct 14 2015, 20:28:29)
[GCC 4.8.4] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>>
```
Use Ctrl-D to exit this console.

#### Django 1.7.1

There are a variety of ways to install Django, but at the moment the apt installed version is 1.6.1 not 1.71. Instead I used the `pip3` method, using the Python package manager, to get the correct version.

Get the pip3 package manager for python 3:
```
$ apt-get install python3-pip
```
Using the pip3, install django:
```
$ pip3 install django
```
Then check to confirm that a high enough version is installed:
```
$ django-admin --version
```
Which should return the version number.

Note: If you have previously installed django using apt there may be conflicts with the locations of some utilities, so it's best to start with the pip tool as a fresh install.

#### PostgreSQL 9.3.5

Install Postgres and postgres server with apt:
```
$ apt-get install postgresql postgresql-server-dev-9.3;
```
Now you should be ready to install i-rode!

## Install the i-rode server
Get the code and configure dependancies.

#### Get the i-rode Code
Clone the i-rode server:
```
$ git clone https://github.com/thebachchaoproject/i-rodeserver.git
```
Head into the new folder:
```
$ cd i-rodeserver/
```
We need a module to support postgres with python:
```
$  pip3 install psycopg2
```
#### Setup Postgres

Become the postgres user:
```
$ su - postgres
```
Create our i-rode db and then change your connection to that:
```
$ CREATE DATABASE irode;
$ \c irode;
```
Add a user and an appropriate grant:
```
$ CREATE USER irode PASSWORD 'magicpants';
$ GRANT ALL ON DATABASE irode TO irode;
```
Exit the psql command line using `\q` and then `exit` to stop being the postgres user.

#### Configure i-rode Settings

Edit the settings.py file to change the database connection information:
```
$ vim irode/settings.py
```
```
     DATABASES = {
         'default': {
             'ENGINE' : 'django.db.backends.postgresql_psycopg2',
                'NAME' : 'irode',
                'USER' : 'rode',
                'PASSWORD' : 'magicpants',
                'HOST' : 'localhost',
                'PORT' : '',
              }
        }
```
Once that's complete you should be able to run the database migrations to bootstrap your db:
```
$ python3 manage.py migrate
```
#### Start the i-rode Server

Start the i-rode server:
```
$ python3 manage.py runserver
```
It should return something like:
```
     System check identified no issues (0 silenced).
     February 11, 2016 - 01:12:36
     Django version 1.9.2, using settings 'irode.settings'
     Starting development server at http://127.0.0.1:8000/
     Quit the server with CONTROL-C.
```
Now you should be able to access the API at http://127.0.0.1:8000/api/getinfo/

Or start it on an alternative ip, domain & port combo:
```
$ python3 manage.py runserver xxx.xxx.xxx.xxx:80
$ python3 manage.py runserver  xxx.org:8080
```

If you see a Django message like:
```
{"message": "Aborted. Not a valid POST request."}
```
You have won :)

## Accessing the i-rode API

#### addinfo
Saves information about the ride.  Takes these options:
```
vehiclenumber (string)
transportmode (string)
date (string: format 2015-02-02)
time (string: format 10:20:30)
to (string)
from (string)
drivername (string: optional)
rating (int: 1 thu 5)
review (string: optional)
photolink (string: complete url, optional)
```
**curl example:**
```
curl -X post -d "vehiclenumber=ka32f1234&date=2015-02-02&time=10:20:30&from=bsk 3rd stage&to=btm 2nd stage&drivername=rajesh g&photolink=http://www.google.com/sjahba/ajhwbhw&review=good driver to drive with&rating=5&transportmode=auto" <yoururl>/api/addinfo/ | more
```

#### getinfo
Gets information by vehical number. Takes the option:
```
vehiclenumber (string)
```
**curl example:**
```
curl -X post -d "vehiclenumber=ka32f1234" <yoururl>/api/getinfo/ | more
```

#### getrating
Returns the rating of a vehicle by it's number. Takes the option:
```
vehiclenumber (string)
```
**curl example:**
```
curl -X post -d "vehiclenumber=ka32f1234" <yoururl>/api/getrating/ | more
```

#### showinfo
Returns an HTML info page.
