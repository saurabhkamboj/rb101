# Create a hash that expresses the frequency with which each letter occurs in this string

statement = "The Flintstones Rock"

# example: { "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }

frequency_hash = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a

letters.each do |letter|
  letter_frequency = statement.count(letter)
  frequency_hash[letter] = letter_frequency if letter_frequency > 0
end
