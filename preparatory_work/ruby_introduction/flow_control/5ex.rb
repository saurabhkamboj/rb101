# code snippet that returned the error message
def equal_to_four(x)
  if x == 4
    puts "yup"
  else
    puts "nope"
end

equal_to_four(5)

## the error message was due to the missing end at the equal_to_four method. We can fix this by adding an additional end to the code snippet

# fixed code snippet
def equal_to_four(x)
  if x == 4
    puts "yup"
  else
    puts "nope"
  end
end

equal_to_four(5)