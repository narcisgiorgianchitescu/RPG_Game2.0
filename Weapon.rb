require_relative 'Item'

class Weapon < Item
	
	def initialize(att=0, defe=0, val=0, nume="Weapon")  
		super(att, defe, val, nume)
	end
	
	def show(i=0)
		super(i)
	end
end
