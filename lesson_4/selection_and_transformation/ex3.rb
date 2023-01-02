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
