require_relative 'Item'

class Equipment < Item

	def initialize(att=0, defe=0, val=0, nume="Head")
		super(att, defe, val, nume)
	end

	def show(i=0)
		super(i)
	end
end
