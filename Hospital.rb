require './Room'
require './Hero'

class Hospital < Room
	def initialize
		@heal = [5, 10, 20, 50]
		@cost = [5,  9, 16, 35]
		@hidden = false
		@hadmoney = 1
	end

	def show()
		system 'cls' or system 'clear'
		#No need for arrays
		puts "Here you can heal your wound. Type :"
		puts "0. To exit"
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
			puts "You have #{hero.hp}HP and #{hero.money} coins."
			puts "You don't have enough money." if @hadmoney == 0
			
			option = gets.chomp.to_i
			check_option(option,hero)
		end
	end

	def check_option(option,hero)
		if option == 0 then
			return
		end

		if option > 0 and option <= @heal.size then
			if hero.money >= @cost[option-1] then
				hero.hp += @heal[option-1]
				hero.money -= @cost[option-1]
				@hadmoney = 1
			else
				@hadmoney = 0
				puts "Not enough money"
			end
		else
			@hadmoney = 1
			puts "We don't have that option."
		end
	end
end