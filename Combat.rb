require_relative 'Monster'
require_relative 'Hero'
require_relative 'Simple_Combat'

class Combat
	def initialize
	end

	def fight(hero, monster)
		until monster.hp < 1 or hero.hp < 1
			print(hero, monster)
			option = gets.chomp.to_i

			if option < 1 and option > 2 then
				puts "Invalid commnad"
			else
				combat(hero, monster, option)
			end

			break if monster.hp < 1

			sleep(1)
		end

		return "Game Over" if hero.hp < 1

		hero.money += monster.money
		puts "You Win! Yay!"
		sleep(1)
		return "Dead Monster"
	end

	def print(hero, monster)
		system 'cls' or system 'clear'

		puts "Monster has the folowing stats:\n\n"
		monster.show_stats

		puts "\nHero has the folowing stats:\n\n"
		hero.showstats
		puts ''

		puts '1 for attack or 2 for defence'
	end

	def combat(hero, monster, option)
		monster_option = rand(2) + 1
		puts 'Monster chose to attack' if monster_option == 1
		puts 'Monster chose to defend' if monster_option == 2
		
		if monster_option == 1 and option == 1 then
			Simple_Combat.new.both_attack(hero, monster)
		elsif monster_option == 1 and option == 2 then
			Simple_Combat.new.monster_attack(hero, monster)
		elsif monster_option == 2 and option == 1 then
			Simple_Combat.new.hero_attack(hero, monster)
		else
			Simple_Combat.new.both_defend(hero, monster)
		end

		puts ''
		puts 'Press enter to continue to next round'
	end
end
