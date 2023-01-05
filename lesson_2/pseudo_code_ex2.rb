def concat(array)
  saved_string = array[0]
  iterator = 1

  while iterator < array.length
    result = saved_string.to_s + array[iterator].to_s
    saved_string = result

    iterator += 1
  end

  puts result
end

a = ["hello", "how", "are"]
concat(a)