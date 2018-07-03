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
		case item.class.to_s
		when "Consumable"
			@attack += item.attack
			@defence += item.defence
		when "Head"
			equip @head, item
			@head = item
		when "Chest"
			equip @chest, item
			@chest = item
		when "Weapon"
			equip @weapon, item
			@weapon = item
		when "Boots"
			equip @weapon, item
			@boots = item
		end
	end

	def equip old_item, new_item
		@attack = @attack - old_item.attack + new_item.attack
		@defence = @defence - old_item.defence + new_item.defence
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
