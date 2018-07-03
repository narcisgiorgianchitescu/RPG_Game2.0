require_relative "CustomMap"
require_relative "RandomMap"

system 'clear' or system 'cls'

puts "Enter a hero name"
name = gets.chomp
hero = Hero.new 50, name

puts "Enter game mode: random/custom"
choice = gets.chomp

game = Game.new map, hero
game.start_game
