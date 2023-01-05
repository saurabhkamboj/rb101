def row(row_number)
  row_count = 1
  current_row = []
  current_number = 2

  while row_count <= row_number
    current_row.clear

    until current_row.size >= row_count
      current_row << current_number
      current_number += 2
    end

    row_count += 1
  end

  current_row
end

def sum(number)
  row(number).sum
end

p sum(2) # => 10
p sum(3) # => 30
p sum(4) # => 68
