load 'Character.rb'
require_relative 'Character.rb'

class Hero < Character
	def initialize(money=10, my_name="noname", hp=100, att=1, defe=1 , head=1, chest=1, boots=1, weapon=1, pos=[1,1])
		super(money,my_name,hp,att,defe)
		@mead = head
		@chest = chest
		@boots = boots
		@weapon = weapon
		@position = pos
	end

	def showstats
		super
		print "Head: ", @head, "\n"
		print "Chest: ",@chest, "\n"
		print "Boots: ", @boots, "\n"
		print "Position: ", @position, "\n"
	end

	def useitem(item)
		case item.class
		when Consumable
			@attack += item.attack
			@defence += item.defence
		when Head
			@head = item
		when Chest
			@chest = item
		when Weapon
			@weapon = item
		when Boots
			@boots = item
		end
	end

	def goup
		@position[0] -= 1
	end
	def godown 
		@position[0] += 1
	end
	def goleft
		@position[1] -= 1
	end
	def goright
		@position[1] += 1
	end
end


