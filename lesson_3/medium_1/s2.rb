puts "the value of 40 + 2 is " + (40 + 2)

## this is showing an error because (40 + 2) results in an integer which is being concatenated into a string

# solution 1
puts "the value of 40 + 2 is " + (40 + 2).to_s

# solution 2
puts "the value of 40 + 2 is #{40 + 2}"
