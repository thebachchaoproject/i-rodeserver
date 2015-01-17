
##############################################
#                                            #
#           Developer: Shreesha S            #
#     Contact: shreesha.suresh@gmail.com     #
#               Version 1.0                  #
#                                            #
##############################################

from django.db import models


# Table 1: Vehicle Information -> Vehicle number and transport mode  
class vehicleInfo(models.Model):
	id = models.AutoField(primary_key=True)
	vehicleNumber = models.CharField("vehicle number", max_length = 20, blank=False)
	transportMode = models.CharField("mode of transport", max_length = 20, blank=False)
	
	def __str__(self):
		return self.vehicleNumber


# Table 2: Trip iInformation -> Travel date, time, location from where the review is being sent, driver's name (optional), link to the photo of driver(optional), and the vehicle information from the previous table
class tripInfo(models.Model):
	id = models.AutoField(primary_key=True)
	date = models.DateField()
	time = models.TimeField()
	#I've used the TextField for location as I didn't know how the location data will be sent from the app.  
	location_from = models.TextField("from", blank=True)
	location_to = models.TextField("to", blank=True)
	driverName = models.CharField("driver's name", max_length = 100, blank=True)
	photoLink = models.URLField("link to photograph", blank=True)
	vehicle = models.ForeignKey(vehicleInfo, verbose_name="vehicle information")

	def __str__(self):
		return self.date


# Table 3: Reviews -> Information about the trip, rating and text review(optional)
class reviews(models.Model):
	id = models.AutoField(primary_key=True)
	sourceInfo = models.ForeignKey(vehicleInfo, verbose_name="vehicle information")
	rating = models.IntegerField("rating out of 5 stars", blank=False)
	review = models.TextField("review of the vehicle/driver",  blank=True)
	trip = models.ForeignKey(tripInfo, verbose_name="trip information")

	def __str__(self):
		return self.review

