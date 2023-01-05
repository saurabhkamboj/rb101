def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

# 1. Take your pick. Do you like << or + for modifying the buffer? The method using '+' is better for modifying the buffer as it returns a new array and does not mutate the orignial array, which is better given that we are avoiding unnecessary mutation of an object.

# 2. Is there a difference between the two, other than what operator she chose to use to concatenate an element to the buffer? Yes, as explained in the answer to question 1 the first method using '<<' mutates the orignial array and returns a refference to the object passed in as the argument for buffer parameter while in the second method we not see any changes to the originial array.