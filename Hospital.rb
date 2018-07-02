require './Room'
require './Hero'

class Hospital < Room
	def initialize
		@heal = [5, 10, 20, 50]
		@cost = [5,  9, 16, 35]
		@hidden = false
	end

	def show()
		system 'cls'
		#No need for arrays
		puts "Here you can heal your wound. Type :"
		puts "1.  5 HP -  5 coins"
		puts "2. 10 HP -  9 coins"
		puts "3. 20 HP - 16 coins"
		puts "4. 50 HP - 35 coins"
	end

	def action(hero)
		@hidden = false
		option = -1

		until option == 0
			show()
			puts "0 to exit hospital."
			
			option = gets.chomp
			check_option(option,hero)
		end
	end

	def check_option(option,hero)
		if option == 0 then
			return
		end

		if option > 0 and option < @heal.size then
			if hero.money >= @cost[option]
				hero.hp += @heal[option]
				hero.money -= @cost[option]
			else
				puts "Not enough money"
			end
		else
			puts "We don't have that option."
		end
	end
end