
require_relative 'Item'

class Consumable < Item
	attr_accessor :hp
	def initialize(att=0, defe=0, val=0, nume="Potion", hp1=0)
		super(att, defe, val, nume)
		@hp=hp1
	end

	def show(i=0)
		super(0)
		print ", #{@hp} hp"
		print " - #{@value} coins" if (i==1)
	end
end
