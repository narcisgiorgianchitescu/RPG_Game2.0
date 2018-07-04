require_relative 'Room'
require_relative 'Hero'
require_relative 'Item'
require_relative 'System_Commands'
require_relative 'Check_Commands'

class Vault < Room
	include SystemCommands
	include CheckCommands

	def initialize items = []
		@items = items
		@got_item = false
		@index_correction = 1
    @Exit = 0
    @Wait_for_input = -1
    @Seconds_to_sleep = 1
	end

	def show()
		system 'cls' or system 'clear'
		puts "Chose one item from the vault :"
		puts "0 to exit"

		@items.each_with_index {|item, index|
			print "#{index + @index_correction} "
			item.show(false)
			puts ""
		}
	end

	def action(hero)
		if @got_item then
			puts "You already chose your item."
			sleep(@Seconds_to_sleep)
			return
		end

		@hidden = false
		option = @Wait_for_input

		until option == @Exit or @got_item
			show()
			puts "\nYou have:\n\n"
			hero.show_stats

			option = gets.chomp.to_i
			check_option(option,hero)
		end
	end

	def check_option(option, hero)
		super

		if option > 0 and option <= @items.size then
			hero.useitem(@items[option - @index_correction])
			@got_item = true
			return
		else
			puts "We don't have that option."
		end
	end
end
