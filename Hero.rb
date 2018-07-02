load 'Character.rb'
#require 'Character.rb'

class Hero < Character
	def initialize(money, my_name, hp, att, defe , head, chest, boots, weapon, pos)
		@Money = money
		@Name = my_name
		@HP = hp
		@ATT = att
		@DEF = defe
		@Head = head
		@Chest = chest
		@Boots = boots
		@Weapon = weapon
		@Position = pos
	end

	def showstats
		super
		print "Head: ", @Head, "\n"
		print "Chest: ",@Chest, "\n"
		print "Boots: ", @Boots, "\n"
		print "Position: ", @Position, "\n"
	end
end


Hr = Hero.new(10,"Narcis",1,1,1,1,1,1,1,1)
Hr.showstats