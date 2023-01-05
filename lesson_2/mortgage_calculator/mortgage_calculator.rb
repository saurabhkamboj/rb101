require 'yaml'

LANGUAGE = 'en' # choose between 'en' (for english) and 'lat' (for latin)

MESSAGES = YAML.load_file("mortgage_calculator_messages.yml")

# methods for prompts

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def prompt(key, type='display')
  message = messages(key, LANGUAGE)

  case type
  when 'question'
    print "=> #{message}"
  when 'error'
    puts "<!> #{message}"
  else
    puts message
  end
end

# sub-methods for calculation

def modify_loan_amount(input)
  if input.include? ','
    input.gsub!(',', '').strip
  else
    input.strip
  end
end

def modify_annual_percent_rate(input)
  if input.include? '%'
    input.gsub!('%', '').strip
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

def monthly_payment(amount, interest, duration)
  amount.to_i * (interest.to_f / (1 - (1 + interest.to_f)**(-duration.to_i)))
end

# methods to validate user input

def valid_loan_amount?(input)
  valid_loan_amount = modify_loan_amount(input)
  valid_loan_amount.to_i.to_s == valid_loan_amount && input.to_i != 0
end

def valid_annual_percent_rate?(input)
  (integer?(input) || float?(input)) && input.to_f != 0.0
end

def valid_loan_duration?(input)
  input.to_i.to_s == input && input.to_i != 0
end

# main loop for calculation

prompt('title')

loop do
  loan_amount = ''
  loop do
    prompt('ask_loan_amount', 'question')
    loan_amount = gets.chomp

    if valid_loan_amount?(loan_amount)
      break
    else
      prompt('invalid_value', 'error')
    end
  end

  annual_percent_rate = ''
  loop do
    prompt('ask_annual_percent_rate', 'question')
    annual_percent_rate = gets.chomp

    if valid_annual_percent_rate?(annual_percent_rate)
      break
    else
      prompt('invalid_value', 'error')
    end
  end

  loan_duration = ''
  loop do
    prompt('ask_loan_duration', 'question')
    loan_duration = gets.chomp

    if valid_loan_duration?(loan_duration)
      break
    else
      prompt('invalid_value', 'error')
    end
  end

  monthly_interest_rate = (annual_percent_rate.to_f / 100) / 12

  result = monthly_payment(loan_amount, monthly_interest_rate, loan_duration)

  prompt('calculating')
  sleep 1

  puts "#{messages('result', LANGUAGE)} #{result.round(2)}!"
  sleep 2

  prompt('calculate_again', 'question')
  answer = gets.chomp

  break unless answer.downcase == "y" || answer.downcase == "yes"
end

prompt('thank_you')
