require './Room'
require './Hero'
require './Item'

class Vault < Room
	def initialize items = []
		@items = items
		@hidden = true
		@got_item = 0
	end

	def show()
		system 'cls' or system 'clear'
		puts "Chose one item :"

		@items.each_with_index {|item, index| 
			print "#{index + 1} "
			item.show(1)
			puts
		}
	end

	def action(hero)
		if @got_item == 1 then
			puts "You already chose your item."
			return
		end

		super
	end

	def check_option(option, hero)
		if option == 0 then
			return
		end

		if option > 0 and option <= @items.size then
			hero.useitem(@items[option-1])
			@got_item = 1
			return
		else
			puts "We don't have that option."
		end
	end
end