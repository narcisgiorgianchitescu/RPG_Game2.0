require './Monster'
require './Hero'

class Simple_Combat
	def initialize
	end

	def both_attack(hero, monster)
			hero.hp -= monster.attack
			monster.hp -= hero.attack
			puts "Hero dealt #{hero.attack} damage"
			puts "Monster dealt #{monster.attack} damage"
	end

	def hero_attack(hero, monster)
			dmg = monster.attack - hero.defence
			puts "Hero dealt #{dmg} damage"
			if dmg < 0 then dmg = 0 end
			hero.hp -= dmg
	end

	def monster_attack(hero, monster)
			dmg = hero.attack - monster.defence
			puts "Monster dealt #{dmg} damage"
			if dmg < 0 then dmg = 0 end
			monster.hp -= dmg
	end

	def both_defend(hero, monster)
		puts "Staring contest"
	end
end