words = "the flintstones rock"

# expected output => "The Flintstones Rock"

words.split.map { |word| word.capitalize }.join(' ')
