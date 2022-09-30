require 'pry'
require 'yaml'

LANGUAGE = 'en' # change language here
MESSAGES = YAML.load_file('mortgage_calculator_messages.yml')

# sub-methods

def modify_loan_amount(input)
  if input.include? ','
    input.gsub!(',','').strip
  else
    input.strip
  end
end

def modify_annual_percent_rate(input)
  if input.include? '%'
    input.gsub!('%','').strip
  else
    input.strip
  end
end

def integer?(input)
  valid_integer = modify_annual_percent_rate(input)
  valid_integer.to_i.to_s == valid_integer
end

def float?(input)
  valid_float = modify_annual_percent_rate(input)
  valid_float.to_f.to_s == valid_float
end

# methods to validate user input

def valid_loan_amount?(input)
  valid_loan_amount = modify_loan_amount(input)
  valid_loan_amount.to_i.to_s == valid_loan_amount
end

def valid_annual_percent_rate?(input)
  integer?(input) || float?(input)
end

def valid_loan_duration?(input)
  input.to_i.to_s == input
end

# code to gather user input

loan_amount = ''
loop do
  print 'Enter loan amount: $'
  loan_amount = gets.chomp

  if valid_loan_amount?(loan_amount)
    break
  else
    puts 'Invalid value. Please enter again'
  end
end

annual_percent_rate = ''
loop do
  print 'Enter Annual percentage rate (APR): '
  annual_percent_rate = gets.chomp

  if valid_annual_percent_rate?(annual_percent_rate)
    break
  else
    puts 'Invalid value. Please enter again.'
  end
end

loan_duration = ''
loop do
  print 'Enter loan duration in months: '
  loan_duration = gets.chomp

  if valid_loan_duration?(loan_duration)
    break
  else
    puts 'Invalid value. Please enter again.'
  end
end

monthly_interest_rate = annual_percent_rate.to_f / 12

monthly_payment = loan_amount.to_i * (monthly_interest_rate / (1 - (1 + monthly_interest_rate)**(-loan_duration.to_i)))

puts monthly_payment