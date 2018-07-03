require_relative "Game"


puts "Enter a hero name"
name = gets.chomp
hero = Hero.new 70, name
map = Map.new

sword = Weapon.new 10, 5, 100, "Sword"
boots = Boots.new 0, 10, 50, "Boots"

shop = Shop.new [sword, boots]
map.add_room shop, [1,2]

hospital = Hospital.new
map.add_room hospital, [2,1]

vault = Vault.new [boots,sword]
map.add_room vault, [0,1]

lair = Lair.new
map.add_room lair, [2,2]

game = Game.new map,hero
game.start_game
