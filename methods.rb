require 'net/http'
require 'addressable/uri'

def pat_custom
  puts 'Введите слово из которого сделать паттерн для угадывания(желательно 3-4 буквы)'
  pattern = gets.chomp
  letter = pattern.split('').sample
  pattern.gsub(letter, '.')
end

def pat_random(path)
  patterns_file = File.new("#{path}/data/patterns.txt", 'r')
  patterns = patterns_file.readlines
  pattern = patterns.sample.chomp
  letter = pattern.split('').sample
  pattern.gsub(letter, '.')
end

def word_exists?(input, pattern)
  if input =~ /#{pattern}/
    uri = Addressable::URI.encode("https://ru.wiktionary.org/wiki/#{input}")
    wiktionary_page = Net::HTTP.get(URI(uri)).force_encoding('UTF-8')
    if wiktionary_page =~ /текст на данной странице отсутствует/
      puts 'Такого слова нет'
      false
    else
      puts '+ 1 очко'
      true
    end
  else
    puts 'Это слово не подходит'
    false
  end
end