def double_numbers(numbers)
  doubled_array = []
  counter = 0

  loop do
    break if counter == numbers.size
    new_number = numbers[counter]
    new_number *= 2 if counter.odd?
    doubled_array << new_number

    counter += 1
  end

  doubled_array
end

my_numbers = [1, 4, 3, 7, 2, 6]
p double_numbers(my_numbers)

# solution 1 - pedac for a method that multiplies each element in a collection with a given criteria.
=begin
  1. Define a method called `multiply` which takes two arguments, an array and a number to multiple with
  2. Initialise a local variable that points to an empty array object.
  3. Create a local variable named counter with a value 0.
  4. Loop through the numbers in the array provided as an argument and multiply each number with the argument provided.
  5. Append the return values of the multiplication into the empty array.
  6. Break when counter equals the size of the array provided as an argument. 
=end

# solution 2 - method multiplying each element in a collection with a given criteria using the `for` loop
def multiply(array, criteria)
  multiplied_array = []

  for i in array
    multiplied_array << i * criteria
  end

  multiplied_array
end

my_numbers = [1, 4, 3, 7, 2, 6]
p multiply(my_numbers, 3)
