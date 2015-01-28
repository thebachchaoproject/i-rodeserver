#############################################################
#                                                           #
#                   Developer: Shreesha S                   #
#          Contact: theteam@thebachchaoproject.org          #
#                        Version 1.0                        #
#          Copyright (c) 2015 The Bachchao Project          #
#                                                           #
#############################################################

# This is a function to normalize the string by converting all

def formatCase(vehicleNumber):
	# Convert all alphabets to upper case
	vehicleNumber = vehicleNumber.upper()
	# Concatenate the strings after clipping spaces
	vehicleNumber = vehicleNumber.replace(" ", "")
	return vehicleNumber
