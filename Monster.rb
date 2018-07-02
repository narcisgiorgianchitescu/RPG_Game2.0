load 'Character.rb'
require_relative 'Character.rb'

class Monster < Character
	def initialize(money, my_name, hp, att, defe, escpch )
		@money = money
		@name = my_name
		@hp = hp
		@attack = att
		@defence = defe
		@escape_chance = escpch
	end
	def showstats
		super
		print "Escape Chance: ", @escape_chance, "\n"
	end
end



