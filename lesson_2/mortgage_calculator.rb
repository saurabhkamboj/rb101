require 'pry'
require 'yaml'

LANGUAGE = 'en' # change language here, choose between 'en' (for english) and 'lat' (for latin).
MESSAGES = YAML.load_file('mortgage_calculator_messages.yml')

# sub-methods for prompts

def messages(message, lang="en")
  MESSAGES[lang][message]
end

def prompt(type="display", key)
  case type
  when "question"
    message = messages(key, LANGUAGE)
    print "=> #{message}"
  when "error"
    message = messages(key, LANGUAGE)
    puts "<!> #{message}"
  else
    message = messages(key, LANGUAGE)
    puts message.to_s
  end
end

# sub-methods for calculation

def m_loan_amount(input)
  if input.include? ','
    input.gsub!(',','').strip
  else
    input.strip
  end
end

def m_annual_percent_rate(input)
  if input.include? '%'
    input.gsub!('%','').strip
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
  p.to_i * (j / (1 - (1 + j)**(-n.to_i)))
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

loop do
  loan_amount = ''
  loop do
    print 'Enter loan amount: $'
    loan_amount = gets.chomp

    if v_loan_amount?(loan_amount)
      break
    else
      puts 'Invalid value. Please enter again'
    end
  end

  annual_percent_rate = ''
  loop do
    print 'Enter Annual percentage rate (APR): '
    annual_percent_rate = gets.chomp

    if v_annual_percent_rate?(annual_percent_rate)
      break
    else
      puts 'Invalid value. Please enter again.'
    end
  end

  loan_duration = ''
  loop do
    print 'Enter loan duration in months: '
    loan_duration = gets.chomp

    if v_loan_duration?(loan_duration)
      break
    else
      puts 'Invalid value. Please enter again.'
    end
  end

  monthly_interest_rate = annual_percent_rate.to_f / 12

  puts monthly_payment(loan_amount, monthly_interest_rate, loan_duration)

  puts("Do you want to perform another calculation? (Y/N): ")
  answer = gets.chomp

  break unless answer.downcase == "y"
end

puts("Thank you")