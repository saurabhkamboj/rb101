
# next_loop.rb

i = 0
loop do
  i = i + 2
  puts i
  if i == 4
    next
  end
  if i == 10
    break
  end
end