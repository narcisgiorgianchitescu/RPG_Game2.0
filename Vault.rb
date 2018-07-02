require './Room'

class Vault < Room

	def initialize items = []
		@items = items
		@hidden = true
		@got_item = 0
	end

	def show()
		system 'cls' or system 'clear'
		puts "Chose one item :"

		@items.each_with_index {|item, index| puts item.show(1, index)}
	end

	def action(hero)
		if @got_item == 1 then
			puts "You already chose your item."
			return
		end

		@hidden = false
		option = -1

		until option == 0
			show()
			puts "Chose wisely."
			puts "0 to exit vault."
			
			option = gets.chomp
			check_option(option)
		end
	end

	def check_option(option)
		if option == 0 then
			return
		end

		if option > 0 and option < @items.size then
			hero.useitem(@items[option])
			@got_item = 1
			return
		else
			puts "We don't have that option."
		end
	end
end