class Character
	def initialize(money, my_name, hp, att, defe )
		@Money = money;
		@Name = my_name;
		@HP = hp;
		@ATT = att;
		@DEF = defe;
	end
	def showstats
		print "Character ", @Name,  " has: \n"
		print @Money, " Money \n"
		print @HP , "% ","Health\n"
		print "Attac: ", @ATT, "\nDefence: ", @DEF, "\n"
	end
end


