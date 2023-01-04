# Pick out the minimum age from our current Munster family hash

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
ages_array = []

ages.each { |key, value| ages_array << value }

# alternate
ages.values.min
