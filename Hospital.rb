require_relative 'Room'
require_relative 'Hero'
require_relative 'System_Commands'
require_relative 'Check_Commands'

class Hospital < Room
	include SystemCommands
	include CheckCommands

	def initialize(heal_options = [[5, 5], [10, 9], [20, 16]])
		@heal_options = heal_options
		super
	end

	def show
		SystemCommands.clear_screen
		
		puts 'Hospital. Here you can heal your wound.'
		puts '0. To exit'

		@heal_options.each_with_index do |(key, value), index|
			puts "#{index + @index_correction}. #{key} HP - #{value} coins"
		end

		puts ''
		puts 'Not enough money.' unless @has_money
	end

	def action(hero)
		@hidden = false
    option = @Wait_for_input

    until option == @Exit
      show
			
			puts "You have #{hero.hp}HP and #{hero.money} coins."
      option = gets.chomp.to_i
      check_option(option,hero)
    end
	end

	def check_option(option,hero)
		super

		if CheckCommands.check_if_between(
				[0, @heal_options.size],
				option - @index_correction) then
			if CheckCommands.check_if_buyer_has_enough_money(
					hero,
					@heal_options[option - @index_correction][1]) then
				hero.hp += @heal_options[option - @index_correction][0]
				hero.money -= @heal_options[option - @index_correction][1]
				@has_money = true
			else
				@has_money = false
				puts "Not enough money"
			end
		else
			@has_money = true
			puts "We don't have that option."
		end
	end
end