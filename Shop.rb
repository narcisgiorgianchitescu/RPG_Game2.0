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

		@items.each_with_index {|item, index| 
			print "#{index + 1} "
			item.show(0)
			puts
		}
	end

	def action(hero)
		@hidden = false
		option = -1

		until option == 0
			puts "0 to exit"
			show()
			
			option = gets.chomp
			check_option(option,hero)
		end
	end

	def check_option(option,hero)
		if option == 0 then
			return
		end

		if option > 0 and option <= @items.size then
			if hero.money >= @item[option-1].value
				hero.useitem(@items[option-1])
				hero.money -= @item[option-1].value
				@items.delete_at(option - 1)
			else
				puts "Not enough money"
			end
		else
			puts "We don't have that option."
		end
	end
end