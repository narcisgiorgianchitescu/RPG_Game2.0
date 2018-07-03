require './Room'
require './Monster'
require './Combat'

class Lair < Room
	def initialize monster = Monster.new
		@monster = monster
		@hidden = true
	end

	def show()
		system 'cls' or system 'clear'
		puts "Room that contains a hideous monster. Please be careful, the monster has the folowing stats:"
		puts ""
		@monster.showstats
		puts ""
	end

	def action(hero)
		@hidden = false
		show()
		puts "The hero has the folowing stats:"
		puts ""
		hero.showstats
		puts ""

		puts "Press a key and tap enter to start combat."
		gets
		
		return Combat.new.fight(hero, @monster)
	end
end
