class Room
	attr_accessor :hidden
	def initialize
		@hidden = true
	end

	def action()
		@hidden = false
	end

	def show()
	end
end
