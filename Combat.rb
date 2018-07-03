require './Monster'
require './Hero'

class Combat
	def fight(hero, monster)
		system 'cls' or system 'clear'

		until monster.hp < 1 or hero.hp < 1
			combat(hero, monster)

			break if monster.hp < 1

			combat(monster, hero)
		end

		return "Game Over" if hero.hp < 1

		hero.money += monster.money
	end

	def combat(attacker, target)
		target.hp -= (attacker.attack - target.defence)
	end
end