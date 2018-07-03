require_relative 'Character.rb'
require_relative 'Head'
require_relative 'Chest'
require_relative 'Boots'
require_relative 'Weapon'
require_relative 'Consumable'

class Hero < Character
	attr_accessor :position
	def initialize(money=10, my_name="noname", hp=100, att=1, defe=1,
		head=Head.new, chest=Chest.new, boots=Boots.new, weapon=Weapon.new, pos=[0,0])

		super(money,my_name,hp,att,defe)
		@head = head
		@chest = chest
		@boots = boots
		@weapon = weapon
		@position = pos
	end

	def showstats
		super
		print "Head: ", @head.show, "\n"
		print "Chest: ",@chest.show, "\n"
		print "Boots: ", @boots.show, "\n"
		print "Weapon: ", @weapon.show, "\n"
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
		@position[1] -= 1
	end
	def godown
		@position[1] += 1
	end
	def goleft
		@position[0] -= 1
	end
	def goright
		@position[0] += 1
	end
end
