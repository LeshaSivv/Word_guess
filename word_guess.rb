require_relative 'methods'

current_path = File.dirname(__FILE__)
puts 'Добро пожаловать в игру *угадай слово*'
puts 'Написать паттерн самому - 1, сгенерировать случайно - 2'
choice = nil
until [1, 2].include?(choice)
  choice = gets.to_i
  case choice
  when 1
    pattern = pat_custom
  when 2
    pattern = pat_random(current_path)
  else
    puts 'Введите 1 или 2'
  end
end
puts 'Введите как можно больше слов заданного паттерна.Нажмите х для выхода из игры'
puts pattern
input = nil
counter = 0
until input == 'x'
  input = gets.chomp
  counter += 1 if word_exists?(input, pattern)
end
puts "Вы заработали #{counter} очков"
