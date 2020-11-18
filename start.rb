require_relative 'near_earth_objects'
require_relative 'formatter'

puts "________________________________________________________________________________________________________________________________"
puts "Welcome to NEO. Here you will find information about how many meteors, astroids, comets pass by the earth every day. \nEnter a date below to get a list of the objects that have passed by the earth on that day."
puts "Please enter a date in the following format YYYY-MM-DD."
print ">>"

date = gets.chomp
neos = NearEarthObjects.new(date)
column_data = Formatter.column_data(neos.astroid_data)

header = "| #{ column_data.map { |_,col| col[:label].ljust(col[:width]) }.join(' | ') } |"
divider = "+-#{column_data.map { |_,col| "-"*col[:width] }.join('-+-') }-+"

formated_date = DateTime.parse(date).strftime("%A %b %d, %Y")
puts "______________________________________________________________________________"
puts "On #{formated_date}, there were #{neos.total_number_of_astroids} objects that almost collided with the earth."
puts "The largest of these was #{neos.largest_astroid_diameter} ft. in diameter."
puts "\nHere is a list of objects with details:"
puts divider
puts header
Formatter.create_rows(neos.astroid_data, column_data)
puts divider
