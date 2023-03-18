x = ""
while x != "STOP" do
  puts "Hi, How are you feeling?"
  ans = gets.chomp
  puts "Want me to ask you again? (If you do not want me to ask again type STOP)"
  x = gets.chomp
end