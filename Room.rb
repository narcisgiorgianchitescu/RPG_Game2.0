class Room
	attr_accessor :hidden
	def initialize
		@hidden = true
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

	def show()
	end
end
