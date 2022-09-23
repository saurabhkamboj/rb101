require "pry"

# these methods convert user inputs into the required case for mortgage calculation

def loan_amount(amount)
  if amount.include? ","
    amount.gsub!(',','').strip
  else
    amount.strip
  end
end

# these methods validate user inputs

def valid_loan_amount?(amount)
  valid_loan_amount = loan_amount(amount)
  valid_loan_amount.to_i.to_s == valid_loan_amount
end

def valid_annual_percentage_rate?(percent)
  valid_annual_percentage_rate = annual_percentage_rate(percent)
  valid_annual_percentage_rate.to_f.to_s == valid_annual_percentage_rate
end

# first we gather user inputs for calculation

input_loan_amount = ''
loop do
  print 'Enter loan amount: $'
  input_loan_amount = gets.chomp

  if valid_loan_amount?(input_loan_amount)
    break
  else
    puts 'Invalid value. Please enter again'
  end
end

input_annual_percentage_rate = ''
loop do
  print 'Enter Annual Percentage Rate (APR): '
  input_annual_percentage_rate = gets.chomp

  if valid_annual_percentage_rate?(input_annual_percentage_rate)
    break
  else
    puts 'Invalid value. Please enter again'
  end
end

input_loan_duration = ''
loop do
  print 'Enter loan duration in months: '
  input_loan_duration = gets.chomp

  if valid_loan_duration?(input_loan_duration)
    break
  else
    puts 'Invalid value. Please enter again'
  end
end