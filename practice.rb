# DON'T CHANGE THIS CODE
# ----------------------
require "net/http"
require "json"
url = "https://weatherdbi.herokuapp.com/data/weather/chicago"
uri = URI(url)
response = Net::HTTP.get(uri)
weather_data = JSON.parse(response)
# ----------------------

# EXERCISE
# Using the Ruby hash `weather_data` that includes weather forecast data for Chicago,
# write a weather summary out to the screen including the current conditions and upcoming forecast.
# Something like the output below.

# Sample output:
# In Chicago, IL it is currently 67 degrees and cloudy.
# The rest of today will be a high of 65 and scattered shows.
# The upcomming weather forecast is:
# Wednesday: a high of 65 and scattered showers.
# Thursday: a high of 67 and partly cloudy.
# Friday: a high of 59 and rain.
# Saturday: a high of 77 and cloudy.
# ...

# STEPS
# Look at the weather_data hash.
# Find the current data.
# Build a string with the text and dynamic data from the hash.
# "In #{...} it is currently #{...} degrees and #{...}"
# Find the array of forecast data.
# Read only the first element of that array to display the conditions for the rest of today.
# Use a loop to display the daily summary for the upcoming forecast.

# 1. inspect the weather_data hash
#puts weather_data

#puts "In #{weather_data["region"]} it is currently #{weather_data["currentConditions"]["temp"]["c"]} degrees C and #{weather_data["currentConditions"]["comment"]}"
#puts "The rest of today will be a high of #{weather_data["next_days"][0]["max_temp"]["c"]} C and #{weather_data["next_days"][0]["comment"]}"
#puts "The upcomming weather forecast is:"
#counter = 0
#for day in weather_data["next_days"]
#    if counter != 0
#        puts "#{day["day"]}: A high of #{day["max_temp"]["c"]} C and #{day["comment"]}"
#    end
#    counter = counter+1
#end

# CHALLENGE
# Can you display the weather forecast summary for a user-entered city?
# Use the following code at the very top of the file and then replace "chicago" in the api url with the user-entered city:
# puts "What city are you in?"
# city = gets.chomp
# puts city
# Note: what happens if the user-entered value is not a known city? You'll want to do some error handling.

weather_data = {}

while (weather_data["status"] == "fail" || weather_data == {}) do
    puts "What city are you in?"
    city = gets.chomp
    url = "https://weatherdbi.herokuapp.com/data/weather/#{city}"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    weather_data = JSON.parse(response)
end

puts "In #{weather_data["region"]} it is currently #{weather_data["currentConditions"]["temp"]["c"]} degrees C and #{weather_data["currentConditions"]["comment"]}"
puts "The rest of today will be a high of #{weather_data["next_days"][0]["max_temp"]["c"]} C and #{weather_data["next_days"][0]["comment"]}"
puts "The upcomming weather forecast is:"
counter = 0
for day in weather_data["next_days"]
    if counter != 0
        puts "#{day["day"]}: A high of #{day["max_temp"]["c"]} C and #{day["comment"]}"
    end
    counter = counter+1
end