require 'yaml'

LANGUAGE = 'en'

MESSAGES = YAML.load_file('tictactoe_messages.yml')

INITIAL_MARKER = ' '
USER_MARKER = 'X'
COMPUTER_MARKER = 'O'

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

# menthods for displaying the board

def display_board(hash)
  system 'clear'
  prompt('marker_information')
  puts "#{messages('remaining_squares', LANGUAGE)}; #{valid_squares(hash).join(' ,')}"
  puts ""
  puts "       |       |"
  puts "   #{hash[1]}   |   #{hash[2]}   |   #{hash[3]}"
  puts "       |       |"
  puts "-------|-------|-------"
  puts "       |       |"
  puts "   #{hash[4]}   |   #{hash[5]}   |   #{hash[6]}"
  puts "       |       |"
  puts "-------|-------|-------"
  puts "       |       |"
  puts "   #{hash[7]}   |   #{hash[8]}   |   #{hash[9]}"
  puts "       |       |"
  puts ""
end

def initialize_squares
  square_values = {}
  (1..9).each { |square| square_values[square] = INITIAL_MARKER }
  square_values
end

def info_squares
  square_values = {}
  (1..9).each do |square|
    square_values[square] = square.to_s
  end

  square_values
end

# sub-methods for validation and result

def valid_squares(hash)
  hash.keys.select { |i| hash[i] == INITIAL_MARKER }
end

def board_full?(hash)
  valid_squares(hash).empty?
end

def someone_won?(hash)
  !!winner(hash)
end

def winner(hash)
  winning_lines = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [4, 6, 9]] + # columns
                  [[1, 5, 9], [3, 5, 7]]              # diagonals

  winning_lines.each do |line|
    if hash[line[0]] == USER_MARKER &&
       hash[line[1]] == USER_MARKER &&
       hash[line[2]] == USER_MARKER
      return 'You'
    elsif hash[line[0]] == COMPUTER_MARKER &&
          hash[line[1]] == COMPUTER_MARKER &&
          hash[line[2]] == COMPUTER_MARKER
      return 'Computer'
    end
  end

  nil
end

# methods for player's move

def users_move!(hash)
  user_square = ''

  prompt('ask_square_choice', 'question')
  loop do
    user_square = gets.chomp.to_i
    break if valid_squares(hash).include?(user_square)

    prompt('error_message', 'error')
  end

  hash[user_square] = USER_MARKER
end

def computers_move!(hash)
  computer_square = valid_squares(hash).sample

  hash[computer_square] = COMPUTER_MARKER
end

# main loop

loop do
  values = initialize_squares
  display_board(info_squares)

  loop do
    users_move!(values)
    display_board(values)
    break if someone_won?(values) || board_full?(values)

    computers_move!(values)
    display_board(values)
    break if someone_won?(values) || board_full?(values)
  end

  if someone_won?(values)
    puts "#{winner(values)} #{messages('congratulations', LANGUAGE)}"
  else
    prompt('tied_game')
  end

  prompt('play_again')
  answer = gets.chomp

  break unless answer.downcase == "y" || answer.downcase == "yes"
end

prompt('thank_you')
