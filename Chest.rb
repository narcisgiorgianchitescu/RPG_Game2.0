require_relative 'Item'

class Chest < Item
	
	def initialize(att=0, defe=0, val=0, nume="Chest Plate")  
		super(att, defe, val, nume)
	end
	
	def show(i=0)
		super(i)
	end
end
