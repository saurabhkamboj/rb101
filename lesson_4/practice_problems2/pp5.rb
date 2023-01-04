# Find the index of the first name that starts with "Be"

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.each_with_index do |name, index|
  puts index if name[0, 2] == "Be"
end

# alternate
flintstones.index { |name| name[0, 2] = "Be" }
