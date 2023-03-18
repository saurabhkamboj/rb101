# ask the user for two numbers
# ask the user for the operation to perform
# perform the operation on the two numbers
# display the result

LANGUAGE = "en" # change language here

require 'yaml'
MESSAGES = YAML.load_file("calculator_messages.yml")

def messages(message, lang="en")
  MESSAGES[lang][message]
end

def prompt(key)
  message = messages(key, LANGUAGE)
  puts message
end

def question_prompt(message)
  print "=> #{message}"
end

def error_prompt(key)
  message = messages(key, LANGUAGE)
  puts "<!> #{message}"
end

def valid_number?(num)
  num.to_i != 0
end

def operator_chosen(op)
  case op
  when "1"
    "Adding"
  when "2"
    "Subtracting"
  when "3"
    "Multiplying"
  when "4"
    "Dividing"
  end
end

prompt("title")

loop do # main loop
  first_number = ""
  loop do
    question_prompt("Enter the first number: ")
    first_number = gets.chomp

    if valid_number?(first_number)
      break
    else
      error_prompt("invalid_number")
    end
  end

  second_number = ""
  loop do
    question_prompt("Enter the second number: ")
    second_number = gets.chomp

    if valid_number?(second_number)
      break
    else
      error_prompt("invalid_number")
    end
  end

  question_prompt("Which operation do you want to perform?
    (1) add
    (2) substract
    (3) multiply
    (4) divide
  Enter your choice of operation from the options above: ")

  # can also be written as:
  # operator_prompt = <<-MSG
  # question_prompt("Which operation do you want to perform?
  #  (1) add
  #  (2) substract
  #  (3) multiply
  #  (4) divide
  # Enter your choice of operation from the options above: ")
  # MSG
  # question_prompt(operator_prompt)

  operator = ""
  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator)
      break
    else
      error_prompt("Must choose 1, 2, 3 or 4.")
    end
  end

  puts "#{operator_chosen(operator)} the two numbers..."

  result = case operator
           when "1"
             first_number.to_i + second_number.to_i
           when "2"
             first_number.to_i - second_number.to_i
           when "3"
             first_number.to_i * second_number.to_i
           else
             first_number.to_f / second_number.to_f
           end

  puts "The result is #{result}!"

  question_prompt("Do you want to perform another calculation? (Y/N): ")
  answer = gets.chomp

  break unless answer.downcase == "y"
end

prompt("thank_you")
