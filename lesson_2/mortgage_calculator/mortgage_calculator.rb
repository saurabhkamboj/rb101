require 'pry'
require 'yaml'

LANGUAGE = 'en' # choose between 'en' (for english) and 'lat' (for latin).

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

def m_loan_amount(input)
  if input.include? ','
    input.gsub!(',', '').strip
  else
    input.strip
  end
end

def m_annual_percent_rate(input)
  if input.include? '%'
    input.gsub!('%', '').strip
  else
    input.strip
  end
end

def integer?(input)
  v_integer = m_annual_percent_rate(input)
  v_integer.to_i.to_s == v_integer
end

def float?(input)
  v_float = m_annual_percent_rate(input)
  v_float.to_f.to_s == v_float
end

def monthly_payment(p, j, n)
  p.to_i * (j.to_f / (1 - (1 + j.to_f)**(-n.to_i)))
end

# methods to validate user input

def v_loan_amount?(input)
  v_loan_amount = m_loan_amount(input)
  v_loan_amount.to_i.to_s == v_loan_amount
end

def v_annual_percent_rate?(input)
  integer?(input) || float?(input)
end

def v_loan_duration?(input)
  input.to_i.to_s == input
end

# code to gather user input

prompt('title')

loop do
  loan_amount = ''
  loop do
    prompt('ask_loan_amount', 'question')
    loan_amount = gets.chomp

    if v_loan_amount?(loan_amount)
      break
    else
      prompt('invalid_value', 'error')
    end
  end

  annual_percent_rate = ''
  loop do
    prompt('ask_annual_percent_rate', 'question')
    annual_percent_rate = gets.chomp

    if v_annual_percent_rate?(annual_percent_rate)
      break
    else
      prompt('invalid_value', 'error')
    end
  end

  loan_duration = ''
  loop do
    prompt('ask_loan_duration', 'question')
    loan_duration = gets.chomp

    if v_loan_duration?(loan_duration)
      break
    else
      prompt('invalid_value', 'error')
    end
  end

  monthly_interest_rate = (annual_percent_rate.to_f / 100) / 12

  result = monthly_payment(loan_amount, monthly_interest_rate, loan_duration)

  prompt('calculating')

  puts "#{messages('result', LANGUAGE)} #{result.round(2)}!"

  prompt('calculate_again', 'question')
  answer = gets.chomp

  break unless answer.downcase == "y"
end

prompt('thank_you')
