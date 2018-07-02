load 'Character.rb'


class Monster < Character
	def initialize(money, my_name, hp, att, defe, escpch )
		super(money, my_name, hp, att, defe)
		@EscapeChance = escpch
	end
	def showstats
		super
		print "Escape Chance: ", @EscapeChance, "\n"
	end
end

Mon = Monster.new(100,"Narcis", 1, 1, 1 , 4)
Mon.showstats




