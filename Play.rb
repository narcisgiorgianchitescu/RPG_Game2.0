require_relative "CustomMap"
require_relative "RandomMap"

system 'clear' or system 'cls'

puts "Enter a hero name"
name = gets.chomp
hero = Hero.new 50, name

puts "Enter game mode: random/custom"
choice = gets.chomp

loop do
  case choice
  when "random"
    map = RandomMap.new.getmap hero
    break
  when "custom"
    map = CustomMap.new.getmap hero
    break
  else
    puts "Invalid input, please choose 'random' or 'custom'"
    choice = gets.chomp
  end
end

game = Game.new map, hero
game.start_game
