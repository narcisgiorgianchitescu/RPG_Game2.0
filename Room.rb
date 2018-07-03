class Room
	attr_accessor :hidden
	def initialize
		@hidden = true
	end

	def action(hero)
		@hidden = false
	end

	def show()
	end
end
