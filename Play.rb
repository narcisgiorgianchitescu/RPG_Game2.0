require_relative "CustomMap"
require_relative "RandomMap"

puts "Enter a hero name"
name = gets.chomp
hero = Hero.new 50, name

puts "Enter game mode: random/custom"
choice = gets.chomp

case choice
when "random"
    map = RandomMap.new.getmap
when "custom"
    map = CustomMap.new.getmap
end

game = Game.new map, hero
game.start_game
