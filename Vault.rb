require './Room'

class Vault < Room

	def initialize items = []
		@items = Array.new
		@hidden = false

		#TODO : generate random items
		@items.push("Helmet", "Mace", "Catana", "Breastplate");
	end

	def show()
		system 'cls'
		puts "Chose one item :"
		@items.each_with_index {|item, index| puts "#{index}. " + item}
	end

	def action(hero)
		puts "Good choice"
	end
end