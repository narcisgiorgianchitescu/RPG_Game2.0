require_relative "CustomGame"

puts "Enter a hero name"
name = gets.chomp
hero = Hero.new 50, name

puts "Enter game mode: random/custom"
choice = gets.chomp

case choice
when "random"
when "custom"
    map = CustomGame.new.getmap
end

game = Game.new map, hero
game.start
