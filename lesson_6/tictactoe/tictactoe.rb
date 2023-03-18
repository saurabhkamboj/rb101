require 'yaml'

# constants

LANGUAGE = 'en'
INITIAL_MARKER = ' '
USER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]

MESSAGES = YAML.load_file('tictactoe_messages.yml')

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
    print "<!> #{message}"
  else
    puts message
  end
end

# main methods

# rubocop:disable Metrics/AbcSize
def display_board(setup_hash)
  system 'clear'
  prompt('marker_info')
  puts "     |     |"
  puts "  #{setup_hash[1]}  |  #{setup_hash[2]}  |  #{setup_hash[3]}"
  puts "     |     |"
  puts "-----|-----|-----"
  puts "     |     |"
  puts "  #{setup_hash[4]}  |  #{setup_hash[5]}  |  #{setup_hash[6]}"
  puts "     |     |"
  puts "-----|-----|-----"
  puts "     |     |"
  puts "  #{setup_hash[7]}  |  #{setup_hash[8]}  |  #{setup_hash[9]}"
  puts "     |     |\n\n"
end
# rubocop:enable Metrics/AbcSize

def users_move!(setup_hash)
  user_square = ''
  puts messages('update', LANGUAGE) +
       "[ #{joinor(valid_squares(setup_hash))} ]"

  prompt('input_move', 'question')
  loop do
    user_square = gets.chomp.to_i

    break if valid_squares(setup_hash).include?(user_square)
    prompt('invalid_input', 'error')
  end

  setup_hash[user_square] = USER_MARKER
end

def computers_move!(setup_hash)
  computer_square = nil

  if !!computer_ai(setup_hash, COMPUTER_MARKER) # winning move
    computer_square = computer_ai(setup_hash, COMPUTER_MARKER)
  elsif !!computer_ai(setup_hash, USER_MARKER) # defensive move
    computer_square = computer_ai(setup_hash, USER_MARKER)
  elsif setup_hash[5] == ' '
    computer_square = 5
  else
    computer_square = valid_squares(setup_hash).sample
  end

  setup_hash[computer_square] = COMPUTER_MARKER
end

def winner(setup_hash)
  WINNING_LINES.each do |line|
    if setup_hash.values_at(*line).all?(USER_MARKER)
      return 'User'
    elsif setup_hash.values_at(*line).all?(COMPUTER_MARKER)
      return 'Computer'
    end
  end
  nil
end

# sub-methods

def initialize_squares
  squares = {}
  (1..9).each { |square| squares[square] = INITIAL_MARKER }

  squares
end

def info_squares
  squares = {}
  (1..9).each do |square|
    squares[square] = square.to_s
  end

  squares
end

def who_goes_first?(players_array)
  prompt('who_plays_first', 'question')

  loop do
    answer = gets.chomp.downcase

    if valid_yes?(answer) || players_array.any?(answer.capitalize)
      players_array.shuffle! if valid_yes?(answer)
      players_array.reverse! if answer == 'computer'
      break
    else
      prompt('error_message', 'error')
    end
  end
end

def valid_squares(setup_hash)
  setup_hash.keys.select { |i| setup_hash[i] == INITIAL_MARKER }
end

def play_move!(player, setup_hash)
  if player == 'User'
    users_move!(setup_hash)
  else
    computers_move!(setup_hash)
  end
end

def next_player(current_player, players_array)
  return players_array[1] if current_player == players_array[0]
  return players_array[0] if current_player == players_array[1]
end

def joinor(squares, delimiter=',', last_delimiter='or')
  case squares.size
  when 0 then ''
  when 1 then squares.first.to_s
  when 2 then squares.join(" #{last_delimiter} ")
  else
    squares[-1] = "#{last_delimiter} #{squares.last}"
    squares.join("#{delimiter} ")
  end
end

def computer_ai(setup_hash, marker)
  WINNING_LINES.each do |line|
    if setup_hash.values_at(*line).count(marker) == 2 &&
       setup_hash.values_at(*line).count(' ') == 1
      return setup_hash.select { |k, v| line.include?(k) && v == ' ' }.keys[0]
    end
  end
  nil
end

def calculate_score(setup_hash, score_hash)
  if !!winner(setup_hash)
    case winner(setup_hash)
    when 'User'
      prompt('user_wins_match')
      score_hash[:user] += 1
    when 'Computer'
      prompt('computer_wins_match')
      score_hash[:computer] += 1
    end
  else
    prompt('tie')
    score_hash[:tie] += 1
  end
end

def print_score(score_hash)
  puts "#{messages('score_info', LANGUAGE)}
  User - #{score_hash[:user]}
  Computer - #{score_hash[:computer]}
  Ties - #{score_hash[:tie]}\n\n"
end

def valid_yes?(string)
  string == "y" || string == "yes"
end

# main loop

loop do
  score = {
    user: 0,
    computer: 0,
    tie: 0
  }

  players = ['User', 'Computer']
  who_goes_first?(players)
  current_player = players[0]

  loop do # game loop
    setup = initialize_squares
    display_board(info_squares)

    loop do # match loop
      play_move!(current_player, setup)
      display_board(setup)
      current_player = next_player(current_player, players)
      break if valid_squares(setup).empty? || !!winner(setup)
    end

    calculate_score(setup, score)
    print_score(score)

    if score[:user] == 5
      prompt('user_wins_game')
      break
    elsif score[:computer] == 5
      prompt('computer_wins_game')
      break
    else
      prompt('next_round')
      current_player = !!winner(setup) ? winner(setup) : players[0]
    end

    sleep 8
    system 'clear'
  end

  prompt('play_again', 'question')
  answer = gets.chomp.downcase

  break unless valid_yes?(answer)
end

prompt('thank_you')
