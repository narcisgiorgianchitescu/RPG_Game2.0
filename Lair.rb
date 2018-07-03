require './Room'
require './Monster'

class Lair < Room
	def initialize monster = nil
		@monster = monster
		@hidden = false
	end

	def show()
		system 'cls' or system 'clear'
		puts "Room that contains a hideous monster. Please be careful, the monster has the folowing stats:"
		@monster.showstats
	end

	def action(hero)
		show()
		puts "The hero has the folowing stats:"
		hero.showstats
		
		#Combat.new.fight(hero, @monster)
	end
end