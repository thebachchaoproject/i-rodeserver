
#############################################################
#                                                           #
#                   Developer: Shreesha S                   #
#          Contact: theteam@thebachchaoproject.org          #
#                        Version 1.0                        #
#          Copyright (c) 2015 The Bachchao Project          #
#                                                           #
#############################################################

from django.db import models


# Table 1: Vehicle Information -> Vehicle number and transport mode  
class vehicleInfo(models.Model):
	id = models.AutoField(primary_key=True)
	vehicleNumber = models.CharField("vehicle_number", max_length = 20, blank=False)
	transportMode = models.CharField("mode_of_transport", max_length = 20, blank=False)
	avg_rating = models.DecimalField("average_rating", max_digits = 20, decimal_places = 4, blank=True)
	
	def __str__(self):
		return self.vehicleNumber


# Table 2: Trip iInformation -> Travel date, time, location from where the review is being sent, driver's name (optional), link to the photo of driver(optional), and the vehicle information from the previous table
class tripInfo(models.Model):
	id = models.AutoField(primary_key=True)
	date = models.DateField()
	time = models.TimeField()
	# Text Field used to store location_from and location_to currently  
	location_from = models.TextField("from", blank=True)
	location_to = models.TextField("to", blank=True)
	driverName = models.CharField("driver_name", max_length = 100, blank=True)
	photoLink = models.URLField("link_to_photograph", blank=True)
	vehicle = models.ForeignKey(vehicleInfo, verbose_name="vehicle_information")

	def __str__(self):
		return self.date


# Table 3: Reviews -> Information about the trip, rating and text review(optional)
class reviews(models.Model):
	id = models.AutoField(primary_key=True)
	sourceInfo = models.ForeignKey(vehicleInfo, verbose_name="vehicle_information")
	rating = models.IntegerField("rating_out_of_5_stars", blank=False)
	review = models.TextField("review_of_the_vehicle-driver",  blank=True)
	trip = models.ForeignKey(tripInfo, verbose_name="trip_information")

	def __str__(self):
		return self.review

