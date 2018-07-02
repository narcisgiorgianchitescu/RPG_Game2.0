load 'Character.rb'
#require 'Character.rb'

class Hero < Character
	def initialize(money=10, my_name="noname", hp=100, att=1, defe=1 , head=1, chest=1, boots=1, weapon=1, pos=[1,1])
		super(money,my_name,hp,att,defe)
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
	def goup
		@Position[0] -= 1
	end
	def godown 
		@Position[0] += 1
	end
	def goleft
		@Position[1] -= 1
	end
	def goright
		@Position[1] += 1
	end
end

