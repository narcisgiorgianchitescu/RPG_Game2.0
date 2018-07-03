require './Monster'
require './Hero'

class Combat
	def initialize
	end

	def fight(hero, monster)
		system 'cls' or system 'clear'

		until monster.hp < 1 or hero.hp < 1
			puts "1 for attack or 2 for defence"
			option = gets.chomp.to_i

			if option < 1 and option > 2 then
				puts "Invalid commnad"
			else
				combat(hero, monster, option)
			end

			break if monster.hp < 1
		end

		return "Game Over" if hero.hp < 1

		hero.money += monster.money
	end

	def combat(hero, monster, option)
		monster_option = rand(2) + 1
		puts "Monster chose to attack" if monster_option == 1
		puts "Monster chose to defend" if monster_option == 2
		
		if monster_option == 1 and option == 1 then
			both_attack(hero, monster)
		elsif monster_option == 1 and option == 2 then
			hero_attack(hero, monster)
		elsif monster_option == 2 and option == 1 then
			monster_attack(hero, monster)
		end
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
end