class Character
	def initialize(money=0, my_name="noname", hp=100, att=1, defe=1 )
		@money = money;
		@name = my_name;
		@hp = hp;
		@attack = att;
		@defence = defe;
	end
	def showstats
		print "Character ", @name,  " has: \n"
		print @money, " Coins \n"
		print @hp , " HP\n"
		print "Attack: ", @attack, "\nDefence: ", @defence, "\n"
	end
end



