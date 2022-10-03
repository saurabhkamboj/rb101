VALID_CHOICES = %w(rock paper scissor)

def question_prompt(message)
  print "=> #{message}"
end

def win?(first, second)
  (first == 'rock' && second == 'scissor') ||
    (first == 'scissor' && second == 'paper') ||
    (first == 'paper' && second == 'rock')
end

def result(choice, computer_choice)
  if win?(choice, computer_choice)
    "You won!"
  elsif win?(computer_choice, choice)
    "Computer won!"
  else
    "It's a tie."
  end
end

loop do
  choice = ''
  loop do
    question_prompt("Choose one - #{VALID_CHOICES.join(', ')}: ")
    choice = gets.chomp

    if VALID_CHOICES.include?(choice)
      break
    else
      puts "Please enter a valid value."
    end
  end

  computer_choice = VALID_CHOICES.sample

  puts "You chose - #{choice}; Computer chose - #{computer_choice}"

  puts result(choice, computer_choice).to_s

  question_prompt("Do you want to play again? ")
  answer = gets.chomp

  break unless answer.downcase == 'y' || answer.downcase == 'yes'
end

puts "Thank you for playing. Good bye!"
