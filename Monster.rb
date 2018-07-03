require_relative 'Character.rb'

class Monster < Character
	def initialize(money=0, my_name="noname", hp=100, att=1, defe=1, escpch=1 )
		super money, my_name, hp, att, defe
		@escape_chance = escpch
	end
	def showstats
		super
		print "Escape Chance: ", @escape_chance, "\n"
	end
end
