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
		dmg = (monster.attack.to_f / hero.defence).round
		if dmg < 0 then dmg = 0 end
		puts "Hero dealt #{dmg} damage"
		monster.hp -= dmg
	end

	def monster_attack(hero, monster)
		dmg = (hero.attack.to_f / monster.defence).round
		if dmg < 0 then dmg = 0 end
		puts "Monster dealt #{dmg} damage"
		hero.hp -= dmg
	end

	def both_defend(hero, monster)
		puts "Staring contest"
	end
end