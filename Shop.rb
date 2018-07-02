require './Room'
require './Hero'
require './Item'

class Shop < Room
	def initialize items = []
		@items = items
		@hidden = true
	end

	def show()
		system 'cls' or system 'clear'
		puts "Have a look :"

		@items.each_with_index {|item, index| item.show(1, index)}
	end

	def action(hero)
		@hidden = false
		option = -1

		until option == 0
			show()
			puts "Happy shopping."
			puts "0 to exit shop."
			
			option = gets.chomp
			check_option(option)
		end
	end

	def check_option(option)
		if option == 0 then
			return
		end

		if option > 0 and option < @items.size then
			if hero.money >= @item[option].value
				hero.useitem(@items[option])
				hero.money -= @item[option].value
				@items.delete_at(option - 1)
			else
				puts "Not enough money"
			end
		else
			puts "We don't have that option."
		end
	end
end