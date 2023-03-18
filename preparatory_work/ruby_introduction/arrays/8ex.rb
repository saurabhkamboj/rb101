array_main = [1, 3, 5, 7, 9]
array_interated = []

array_main.each do |n|
  array_interated << n + 2
end

p array_main
p array_interated