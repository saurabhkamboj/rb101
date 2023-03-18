# Calculator: Lesson 2: Small Programs: Bonus Features added
require 'yaml'
MESSAGES = YAML.load_file('calc_msgs.yml')

def messages(lang, message)
  MESSAGES[lang][message]
end

def prompt(key)
  message = messages(LANG, key)
  Kernel.puts("=> #{message}")
end

def integer?(num)
  num.to_i.to_s == num # integer validation
end

def float?(float)
  float.to_f.to_s == float # float validation
end
LANG = ''
loop do
  puts "=> Which language would you like to use for this calculation \n-> En for English and Hi for Hindi"
  puts ''
  puts "=> इस गणना के लिए आप कौन सी भाषा का प्रयोग करना चाहेंगे अंग्रेजी/हिंदी\n-> अंग्रेजी के लिए En और हिंदी के लिए Hi"
  loop do
    LANG = gets.chomp.downcase
    if LANG == 'en' || LANG == 'hi' 
      # I couldn't make it work the other way around if lang != 'en' || lang != 'hi' => it goes into infinite loop
      break
    else
    puts 'Please choose one of the languages En/Hi'
    end
  end

  prompt('welcome')
  prompt('first_num')

  num1 = ''
  loop do
    num1 = Kernel.gets.chomp
    break if integer?(num1) || float?(num1)

    prompt('valid_num')
  end

  prompt('second_num')
  num2 = ''

  loop do
    num2 = Kernel.gets.chomp
    break if integer?(num2) || float?(num2)

    prompt('valid_num')
  end

  prompt('op_msg')

  operation = ''

  loop do
    operation = Kernel.gets.chomp
    break if %w[1 2 3 4].include?(operation)

    prompt('valid_op')
  end

  case operation
  when '1'
    print "...#{num1} #{num2} "
    prompt('add_op')
    puts num1.to_i + num2.to_i
  when '2'
    print "...#{num1} #{num2} "
    prompt('subtract_op')
    puts num1.to_i - num2.to_i
  when '3'
    print "...#{num1} and #{num2} "
    prompt('multiply_op')
    puts num1.to_i * num2.to_i
  when '4'
    print "...#{num1} and #{num2}"
    prompt('divide_op')
    puts num1.to_f / num2.to_f
    # expected this to work with converting just one number to_f however gives an error
  end

  prompt('repeat_calc')
  answer = gets.chomp.downcase
  break unless answer.start_with?('y')
end

prompt('thank_you')
