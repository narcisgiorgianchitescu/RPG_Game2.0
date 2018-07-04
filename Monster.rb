require_relative 'Character.rb'

# Monster Definition
class Monster < Character
  def initialize(money = 0, my_name = 'noname', hp = 10, attack = 1,
                 defence = 1, escape_chance = 1)
    super(money, my_name, hp, attack, defence)
    @escape_chance = escape_chance
  end

  def show_stats
    super
    print "Escape Chance: ", @escape_chance, "\n"
  end
end
