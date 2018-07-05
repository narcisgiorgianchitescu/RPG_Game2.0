require_relative 'Monster'
require_relative 'Hero'
require_relative 'Simple_Combat'
require_relative 'RandomCombat'
require_relative 'System_Commands'

class Combat
  include SystemCommands

  def initialize
    @Attack = 1
    @Defend = 2
    @MIN_TO_STAY_ALIVE = 1
  end

  def fight(hero, monster)
    start_fight(hero, monster)

    return 'Game Over' if hero.hp < @MIN_TO_STAY_ALIVE

    hero.money += monster.money
    puts 'You Win!'

    SystemCommands.wait_for_input
    return 'Dead Monster'
  end

  def start_fight(hero, monster)
    until monster.hp < @MIN_TO_STAY_ALIVE || hero.hp < @MIN_TO_STAY_ALIVE
      print_stats_for(hero, monster)
      option = gets.chomp.to_i

      if option != @Attack && option != @Defend then
        puts 'Invalid commnad'
      else
        #combat(SimpleCombat.new(hero, monster), option)
        combat(RandomCombat.new(hero, monster), option)
      end

      break if monster.hp < @MIN_TO_STAY_ALIVE

      SystemCommands.wait_for_input
    end
  end

  def print_stats_for(hero, monster)
    SystemCommands.clear_screen

    puts "Monster has the folowing stats:\n\n"
    monster.show_stats

    puts "\nHero has the folowing stats:\n\n"
    hero.show_stats
    puts ''

    puts '1 for attack or 2 for defence'
  end

  def combat(simple_combat, hero_option)
    simple_combat.do_round(hero_option)
  end
end
