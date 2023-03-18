# first solution
def everyOther(arr)
  new_arr = []
  counter = 0

  arr.select do |n|
    counter += 1
    
    if counter.odd?
      new_arr << n
    else
      next
    end
  end

  new_arr
end

everyOther([1, 3, 5, 6, 8])

# second solution
def everyOther(arr)
  new_arr = []
  counter = 0

  arr.select do |n|
    counter += 1
    new_arr << n if counter.odd?
  end

  new_arr
end

everyOther([1, 3, 5, 6, 8])