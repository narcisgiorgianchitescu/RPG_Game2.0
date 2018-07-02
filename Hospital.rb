require './Room'

class Hospital < Room
	def initializa
		@hidden = false
	end

	def show()
		system 'cls'
		#No need for arrays
		puts "Here you cam heal your wound. Type :"
		puts "1.  5 HP -  5 coins"
		puts "2. 10 HP -  9 coins"
		puts "3. 20 HP - 16 coins"
		puts "4. 50 HP - 35 coins"
	end

	def action(hero)
		puts "Hero got healed"
	end
end