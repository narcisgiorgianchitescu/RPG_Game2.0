require_relative 'Room'
require_relative 'Hero'
require_relative 'Item'
require_relative 'System_Commands'
require_relative 'Check_Commands'

class Shop < Room
	include SystemCommands
	include CheckCommands

	def initialize(items = [])
		@items = items
		@has_money = true
		@hidden = true
		@index_correction = 1
    @Exit = 0
    @Wait_for_input = -1
	end

	def show
		system 'cls' or system 'clear'
		puts "Shop's open. Have a look :"
		puts "0 to exit"

		@items.each_with_index do |item, index|
			print "#{index + @index_correction} "
			item.show(true)
			puts
		end

		puts "You don't have enough money." unless @has_money
	end

	def action(hero)
		@hidden = false
		option = @Wait_for_input

		if @items.size < 1 then
			puts "No more items to sell."
			return
		end

		until option == @Exit
			show()
			puts
			hero.show_stats
			option = gets.chomp.to_i
			check_option(option,hero)
		end
	end

	def check_option(option,hero)
		super

		if CheckCommands.check_if_between(
				1,
				@items.size,
				option - @index_correction) then
			if CheckCommands.check_if_buyer_has_enough_money(
					hero,
					@items[option - @index_correction][1]) then
				hero.useitem(@items[option - @index_correction])
				hero.money -= @items[option - @index_correction][1]
				@items.delete_at(option - @index_correction)
				@has_money = true
			else
				@has_money = false
			end
		else
			@has_money = true
			puts "We don't have that option."
		end
	end
end
