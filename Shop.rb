require './Room'
require './Hero'
require './Item'

class Shop < Room
	def initialize items = []
		@items = items
		@hidden = true
		@hadmoney = 1
	end

	def show()
		system 'cls' or system 'clear'
		puts "Shop's open. Have a look :"
		puts "0 to exit"

		@items.each_with_index do |item, index|
			print "#{index + 1} "
			item.show(0)
			puts
		end

		puts "You don't have enough money." if @hadmoney == 0
	end

	def action(hero)
		@hidden = false
		option = -1

		if @items.size < 1 then
			puts "No more items to sell."
			return
		end

		until option == 0
			show()
			puts
			hero.showstats
			option = gets.chomp.to_i
			check_option(option,hero)
		end
	end

	def check_option(option,hero)
		if option == 0 then
			return
		end

		if option > 0 and option <= @items.size then
			if hero.money >= @items[option-1].value then
				hero.useitem(@items[option-1])
				hero.money -= @items[option-1].value
				@items.delete_at(option - 1)
				@hadmoney = 1
			else
				@hadmoney = 0
			end
		else
			@hadmoney = 1
			puts "We don't have that option."
		end
	end
end
