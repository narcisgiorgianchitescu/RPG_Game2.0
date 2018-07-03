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

		puts "Press a key and tap enter to start combat."
		gets
		Combat.new.fight(hero, @monster)
	end
end
