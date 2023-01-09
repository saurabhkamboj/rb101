arr = [[2], [3, 5, 7, 12], [9], [11, 13, 15]]

arr.map do |sub_array|
  sub_array.select do |element|
    element % 3 == 0
  end
end
