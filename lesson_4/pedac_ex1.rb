# Given a string, write a method `palindrome_substrings` which returns
# all the substrings from a given string which are palindromes. Consider
# palindrome words case sensitive.

# Test cases:

# palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
# palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
# palindrome_substrings("palindrome") == []
# palindrome_substrings("") == []

# Problem
# Input = string
# Output = an array of substrings

# Explicit requirements -
#   1. return only substrings which are palindromes
#   2. plaindromes are case sensitive, meaning DBd is not a palindrome.

# Algrotihm (High level)
# 1. Initiate a reuslt variable pointing to an empty array.
# 2. Create an array named substring_arr that contains all of the substrings of the input string that are atleast 2 characters long.
# 3. Loop through the substrings in the substrings array.
# 4. If the substring is a palindrome, append it to the result variable.
# 5. Return the result variable.

def palindrome_substrings(str)
  result = []
  substrings_arr = substrings(str)
  substrings_arr.each do |substring|
    result << substring if is_palindrome?(substring)
  end
  result
end

# Two method to write substrings() and is_palindrome?()
# Example of substrings of a string for the given problem:
# string = "Halo"
# substrings = %w(ha hal halo al alo lo)

# for each starting index from 0 through the next to last index position
  # for each substring length from 2 until there are no substrings of that length
    # extract the substring of the indicated length starting at the indicated index position
  # end of inner loop
# end of outer loop.

# Outer loop - ranges from startingIndex till the second last value; str.length - 2
# Inner loop - ranges from minimum character length required till the string.length - startingIndex

# - create an empty array called `result` that will contain all required substrings
# - create a `starting_index` variable (value `0`) for the starting index of a substring
# - start a loop that iterates over `starting_index` from `0` to the length of the string minus 2
#   - create a `num_chars` variable (value `2`) for the length of a substring
#   - start an inner loop that iterates over `num_chars` from `2` to `string.length - starting_index`
#     - extract a substring of length `num_chars` from `string` starting at `starting_index`
#     - append the extracted substring to the `result` array
#     - increment the `num_chars` variable by `1`
#   - end the inner loop
#   - increment the `starting_index` variable by `1`
# - end the outer loop
# - return the `result` array

# Formal pseudo code
# START
#
#   /* Given a string named `string` */
#
#   SET result = []
#   SET starting_index = 0
#
#   WHILE starting_index <= length of string - 2
#     SET num_chars = 2
#     WHILE num_chars <= length of string - starting_index
#       SET substring = num_chars characters from string starting at index starting_index
#       append substring to result array
#       SET num_chars = num_chars + 1
#
#     SET starting_index = starting_index + 1
#
#   RETURN result
#
# END

def substrings(str)
  result = []
  starting_index = 0

  while (starting_index <= str.length - 2)
    num_chars = 2
    while (num_chars <= str.length - starting_index)
      substring = str.slice(starting_index, num_chars)
      result << substring
      num_chars += 1
    end
    starting_index += 1
  end
  result
end

# - Inside the `is_palindrome?` method, check whether the string
#   value is equal to its reversed value. You can use the
#   String#reverse method.

def is_palindrome?(str)
  return str == str.reverse
end

# Complete PEDAC
# input: a string
# output: an array of substrings
# rules: palindrome words should be case sensitive, meaning "abBA"
#        is not a palindrome

# Algorithm:
#  substrings method
#  =================
#    - create an empty array called `result` that will contain all required substrings
#    - create a `starting_index` variable (value `0`) for the starting index of a substring
#    - start a loop that iterates over `starting_index` from `0` to the length of the string minus 2
#      - create a `num_chars` variable (value `2`) for the length of a substring
#      - start an inner loop that iterates over `num_chars` from `2` to `string.length - starting_index`
#        - extract a substring of length `num_chars` from `string` starting at `starting_index`
#        - append the extracted substring to the `result` array
#        - increment the `num_chars` variable by `1`
#      - end the inner loop
#      - increment the `starting_index` variable by `1`
#    - end the outer loop
#    - return the `result` array

#  is_palindrome? method
#  =====================
# - Inside the `is_palindrome?` method, check whether the string
#   value is equal to its reversed value. You can use the
#   String#reverse method.

#  palindrome_substrings method
#  ============================
#  - initialize a result variable to an empty array
#  - create an array named substring_arr that contains all of the
#    substrings of the input string that are at least 2 characters long.
#  - loop through the words in the substring_arr array.
#  - if the word is a palindrome, append it to the result
#    array
#  - return the result array

# Code
def substrings(str)
  result = []
  starting_index = 0;

  while (starting_index <= str.length - 2)
    num_chars = 2
    while (num_chars <= str.length - starting_index)
      substring = str.slice(starting_index, num_chars)
      result << substring
      num_chars += 1
    end
    starting_index += 1
  end
  result
end

def is_palindrome?(str)
  str == str.reverse
end

def palindrome_substrings(str)
  result = []
  substrings_arr = substrings(str)
  substrings_arr.each do |substring|
    result << substring if is_palindrome?(substring)
  end
  result
end

p palindrome_substrings("supercalifragilisticexpialidocious"); # ["ili"]
p palindrome_substrings("abcddcbA");   # ["bcddcb", "cddc", "dd"]
p palindrome_substrings("palindrome"); # []
p palindrome_substrings("");           # []
