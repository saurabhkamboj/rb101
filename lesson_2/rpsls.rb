VALID_CHOICES = %w[rock paper scissors lizard spock]

OUTCOMES = {
  rock: %w[scissors lizard],
  paper: %w[rock spock],
  scissors: %w[paper lizard],
  lizard: %w[spock paper],
  spock: %w[rock scissors]
}

stats = {
  player: 0,
  computer: 0,
  tie: 0
}

results = ['You won!', 'The computer won!', "It's a tie!"]

def win?(choice1, choice2, index)
  OUTCOMES[choice1.to_sym][index] == choice2
end

def question_prompt(message)
  print "=> #{message}"
end

# main loop of the game

loop do
  player_choice = ''
  question_prompt("Please choose either [R]ock, [P]aper, [S]cissors, [L]izard, or [Sp]ock: ")

  loop do
    loop do
      player_choice = gets.chomp.downcase
      if player_choice == 'r'
        player_choice = 'rock'
      elsif player_choice == 'p'
        player_choice = 'paper'
      elsif player_choice == 's'
        player_choice = 'scissors'
      elsif player_choice == 'l'
        player_choice = 'lizard'
      elsif player_choice == 'sp'
        player_choice = 'spock'
      end

      if VALID_CHOICES.include?(player_choice)
        break
      else
        puts "Please enter a valid value."
      end
    end

    computer_choice = VALID_CHOICES.sample

    # loop to find the result
    
    puts "You chose #{player_choice.capitalize}!"
    puts "Computer chooses #{computer_choice.capitalize}!"

    if win?(player_choice, computer_choice, 0)
      stats[:player] += 1
      puts results[0].to_s
    elsif win?(player_choice, computer_choice, 1)
      stats[:player] += 1
      puts results[0].to_s
    elsif win?(computer_choice, player_choice, 0)
      stats[:computer] += 1
      puts results[1].to_s
    elsif win?(computer_choice, player_choice, 1)
      stats[:computer] += 1
      puts results[1].to_s
    else
      stats[:tie] += 1
      puts results[2].to_s
    end

    puts "Score
    Player - #{stats[:player]}
    Computer - #{stats[:computer]}
    Ties - #{stats[:tie]}"

    if stats[:player] == 2
      puts "Yay...you won the game!"
      break
    elsif stats[:computer] == 2
      puts "The computer won the game!"
      break
    else
      puts "Next round..."
    end

    sleep 10
    system("clear") || system("cls")
    question_prompt("Please choose either [R]ock, [P]aper, [S]cissors, [L]izard, or [Sp]ock: ")
  end

  stats[:player] = 0
  stats[:computer] = 0

  question_prompt("Do you want to play again? ")
  answer = gets.chomp.downcase

  break unless answer.downcase == 'y' || answer.downcase == 'yes'
end

puts "Thank you for playing. Good bye!"
