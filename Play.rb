require_relative 'CustomMap'
require_relative 'RandomMap'

system('clear') || system('cls')

puts 'Enter a hero name'
name = gets.chomp
hero = Hero.new 50, name, 100, 10, 6

puts 'Enter game mode: random/custom'
choice = gets.chomp

map = nil

loop do
  case choice
  when 'random'
    map = RandomMap.new.get_map hero
    break
  when 'custom'
    map = CustomMap.new.get_map hero
    break
  else
    puts "Invalid input, please choose 'random' or 'custom'"
    choice = gets.chomp
  end
end

map.clear_room hero.position

game = Game.new map, hero
game.start_game
