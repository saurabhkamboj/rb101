def factors(number)
  divisor = number
  factors = []
  while divisor > 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end

# 1. What is the purpose of the number % divisor == 0 ? Checks if the remainder of the division is equal to 0.
# 2. What is the purpose of the second-to-last line (line 8) in the method (the factors before the method's end)? Its purpose is to ensure that the return value of the method is the factors array.
