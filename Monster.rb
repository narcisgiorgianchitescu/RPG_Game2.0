load 'Character.rb'


class Monster < Character
	def initialize(money=0, my_name="noname", hp=100, att=1, defe=1, escpch=1 )
		super(money, my_name, hp, att, defe)
		@EscapeChance = escpch
	end
	def showstats
		super
		print "Escape Chance: ", @EscapeChance, "\n"
	end
end






