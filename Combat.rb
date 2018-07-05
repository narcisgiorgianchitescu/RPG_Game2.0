require_relative 'Monster'
require_relative 'Hero'
require_relative 'Simple_Combat'
require_relative 'System_Commands'

class Combat
	include SystemCommands

	def initialize
		@Attack = 1
		@Defend = 2
		@Min_to_stay_alive = 1
	end

	def fight(hero, monster)
		until monster.hp < @Min_to_stay_alive or hero.hp < @Min_to_stay_alive
			print_stats_for(hero, monster)
			option = gets.chomp.to_i

			if option != @Attack and option != @Defend then
				puts "Invalid commnad"
			else
				combat(Simple_Combat.new(hero, monster), option)
			end

			break if monster.hp < @Min_to_stay_alive

			SystemCommands.wait_for_input
		end

		return "Game Over" if hero.hp < @Min_to_stay_alive

		hero.money += monster.money
		puts "You Win! Yay!"

		SystemCommands.wait_for_input
		return "Dead Monster"
	end

	def print_stats_for(hero, monster)
		system 'cls' or system 'clear'

		puts "Monster has the folowing stats:\n\n"
		monster.show_stats

		puts "\nHero has the folowing stats:\n\n"
		hero.show_stats
		puts ''

		puts '1 for attack or 2 for defence'
	end

	def combat(simple_combat, hero_option)
		simple_combat.do_round(hero_option)
	end
end
