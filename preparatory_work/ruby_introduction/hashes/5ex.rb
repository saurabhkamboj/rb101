# we could use the 'value?' method

hash = {
  one: 1,
  two: 2,
  three: 3
}

if hash.value?(2)
  puts "It contins it."
else
  puts "It does not contain it."
end