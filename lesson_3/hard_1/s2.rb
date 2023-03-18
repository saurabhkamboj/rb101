greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings

# What is the result of the last line in the code below? The result will be {:a=>"hi there"}
