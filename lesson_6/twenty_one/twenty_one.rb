SUITS = ['h', 'd', 'c', 's']
CARDS = ('2'..'10').to_a + ['Jack', 'Queen', 'King'] + ['Ace']
BUSTED_VALUE = 21
DEALER_CUTOFF = 17

def green(text); "\e[32m#{text}\e[0m"; end
def red(text); "\e[31m#{text}\e[0m"; end
def yellow(text); "\e[1;33m#{text}\e[0m"; end

# main methods

def initiate_deck
  SUITS.product(CARDS).shuffle
end

def total_value(cards)
  total = 0

  cards.each do |card|
    if card[1] == 'Ace'
      total += 11
    elsif card[1].to_i == 0
      total += 10
    else
      total += card[1].to_i
    end
  end

  cards.select { |card| card[1] == 'Ace' }.count.times do
    total -= 10 if total > BUSTED_VALUE
  end

  total
end

def busted?(total_value)
  total_value > BUSTED_VALUE
end

def display_result(player_cards, dealer_cards, player_total, dealer_total, score)
  case detect_result(player_total, dealer_total)
  when :player_busted
    puts "You busted! #{red("Dealer wins")}."
    score[:dealer] += 1
  when :dealer_busted
    puts "Dealer busted! #{green("You win")}."
    score[:player] += 1
  when :player_wins
    print_details(player_cards, dealer_cards, player_total, dealer_total)
    puts green("You win!").to_s
    score[:player] += 1
  when :dealer_wins
    print_details(player_cards, dealer_cards, player_total, dealer_total)
    puts red("Dealer wins!").to_s
    score[:dealer] += 1
  when :tie
    print_details(player_cards, dealer_cards, player_total, dealer_total)
    puts yellow("It's a tie!").to_s
    score[:tie] += 1
  end

  print_score(score)
end

def play_again?
  print "=> Do you want to play again? (Y/N): "
  answer = gets.chomp.downcase
  answer.start_with?('y')
end

# sub methods

def detect_result(player_total, dealer_total)
  if player_total > BUSTED_VALUE
    :player_busted
  elsif dealer_total > BUSTED_VALUE
    :dealer_busted
  elsif player_total > dealer_total
    :player_wins
  elsif player_total < dealer_total
    :dealer_wins
  else
    :tie
  end
end

def print_details(player_cards, dealer_cards, player_total, dealer_total)
  puts "-" * 20
  puts "Dealer has #{dealer_cards}, for a total of #{dealer_total}."
  puts "Player has #{player_cards}, for a total of #{player_total}."
  puts "#{"-" * 20}\n\n"
end

def print_score(score)
  puts "Score:
  Player - #{score[:player]}
  Dealer - #{score[:dealer]}
  Ties - #{score[:tie]}\n\n"
end

def game_over?(score)
  if score[:player] == 5
    puts "Yay! you won the game!"
    return true
  elsif score[:dealer] == 5
    puts "Dealer won the game!"
    return true
  else
    puts "Next round..."
    puts "#{"=" * 20}\n\n"
  end
end

# game loop

loop do
  puts "\n[ Welcome to #{BUSTED_VALUE} ]\n\n"
  score = {
    player: 0,
    dealer: 0,
    tie: 0
  }
  
  loop do
    deck = initiate_deck
    player_cards = []
    dealer_cards = []

    2.times do
      player_cards << deck.pop
      dealer_cards << deck.pop
    end

    player_total = total_value(player_cards)
    dealer_total = total_value(dealer_cards)

    puts "Dealer has #{dealer_cards[0]} & an unknown card."
    puts "Player has #{player_cards.first} & #{player_cards.last}.\n\n"

    # loop for player's turn
    loop do
      print "=> Hit or stay? "
      player_input = ''
      loop do
        player_input = gets.chomp.downcase
        break if player_input == 'hit' || player_input == 'stay'
        print "Error! You must enter 'hit' or 'stay': "
      end

      if player_input == 'hit'
        player_cards << deck.pop
        player_total = total_value(player_cards)
        puts "You chose to hit!"
        puts "You now have #{player_cards}"
        puts "Your cards total: #{player_total}\n\n"
      end

      break if player_input == 'stay' || busted?(player_total)
    end

    if busted?(player_total)
      display_result(player_cards, dealer_cards, player_total, dealer_total, score)
      game_over?(score) ? break : next
    else
      puts "You stayed at #{player_total}.\n\n"
    end

    # loop for dealer's turn
    loop do
      break if dealer_total >= DEALER_CUTOFF

      puts "Dealer hits!"
      dealer_cards << deck.pop
      dealer_total = total_value(dealer_cards)
      puts "Dealer now has #{dealer_cards}"
      puts "Dealer's cards total: #{dealer_total}\n\n"
    end

    # end game logic
    if busted?(dealer_total)
      display_result(player_cards, dealer_cards, player_total, dealer_total, score)
      game_over?(score) ? break : next
    else
      puts "Dealer stayed at #{dealer_total}.\n\n"
    end

    display_result(player_cards, dealer_cards, player_total, dealer_total, score)
    game_over?(score) ? break : next
  end

  break unless play_again?
end

puts "Thank you for playing #{BUSTED_VALUE}."
