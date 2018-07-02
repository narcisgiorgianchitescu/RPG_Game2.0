require './Room'

class Shop < Room
	def initialize items = []
		@items = items
		@hidden = false

		#TODO : generate random items
		
	end

	def show()
		system 'cls'
		puts "Have a look :"

		@items.each_with_index {|item, index| item.show(1, index)}
	end

	def action(hero)
		puts "Hero bought something"
	end
end