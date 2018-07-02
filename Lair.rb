require './Room'

class Lair < Room
	def initialize monster = nil
		@monster = monster
		@hidden = false
	end

	def show()
		system 'cls'
		puts "Room that contains various monsters"
	end

	def action(hero)
		puts "Hero fight monster"
	end
end