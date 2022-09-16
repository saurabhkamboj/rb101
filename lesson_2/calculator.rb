# ask the user for two numbers
# ask the user for the operation to perform
# perform the operation on the two numbers
# display the result

Kernel.puts("My CALCULATOR")

Kernel.print("Enter the first number: ")
first_number = Kernel.gets().chomp()

Kernel.print("Enter the second number: ")
second_number = Kernel.gets().chomp()

Kernel.print("Which operation do you want to perform?
  (1) add
  (2) substract
  (3) multiply
  (4) divide
Enter your choice of operation from the options above: ")
operator = Kernel.gets().chomp()

case operator
when "1"
  result = first_number.to_f() + second_number.to_f()
when "2"
  result = first_number.to_f() - second_number.to_f()
when "3"
  result = first_number.to_f() * second_number.to_f()
else 
  result = first_number.to_f() / second_number.to_f()
end

Kernel.puts("The result is #{result}!")