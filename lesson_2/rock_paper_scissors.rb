VALID_CHOICES = ['rock', 'paper', 'scissors']

def question_prompt(message)
  print "=> #{message}"
end

def result(choice, computer_choice)
  if choice == computer_choice
    "It's a tie!"
  elsif (choice == 'rock' && computer_choice == 'scissors') ||
    (choice == 'scissors' && computer_choice == 'paper') ||
    (choice == 'paper' && computer_choice == 'rock')
    "You won!"
  else
    "Computer won!"
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
