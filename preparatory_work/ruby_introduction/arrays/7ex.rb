cities = ["Mohali","Hyderabad","Delhi","Dehradun","Mumbai","Kathmandu"]

cities.each_with_index do | name, index |
  puts "#{index + 1}. #{name}"
end