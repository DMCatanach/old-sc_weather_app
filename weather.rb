require 'barometer'

#temperature.f gives temp in Fahrenheit; default is celsius
#current.condition gives current conditions, .condition doesn't work with .forecast, .today, .tomorrow
#can use .high, .low with .today and .tomorrow

#method to determine user's location, called in new barometer later
def get_location
	
	puts "What is your current location?"
	user_location = gets.chomp
	
end

#basic forecast, calls get_location method for location data
#now uses strftime to display forecast with "tomorrow" and days of the week. 
barometer = Barometer.new(get_location)
weather = barometer.measure  #gets measurements; vital step! 
tomorrow = Time.now.strftime('%d').to_i + 1  #this provides comparison for if/else loop; if using %w, will just put day of week
weather.forecast.each do |forecast| 
	day = forecast.starts_at.day
	#determining whether to put "tomorrow" or weekday name in forecast output 
	if day == tomorrow 
		weekday = "Tomorrow"
	else 
		weekday = forecast.starts_at.strftime('%A')
	end
	#forecast output 
	puts "#{weekday} is going to be #{forecast.icon} with a low of #{forecast.low.f.to_s} and a high of #{forecast.high.f.to_s}."
				
end
