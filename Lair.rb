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
	end

	def action(hero)
		@hidden = false
		show()
		puts "The hero has the folowing stats:\n"
		hero.showstats

		puts "Press a key and tap enter to start combat."
		gets
		Combat.new.fight(hero, @monster)

		puts "Press a key and tap enter to start combat."
		gets
	end
end
