class Character
	def initialize(money=0, my_name="noname", hp=100, att=1, defe=1 )
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


