require_relative 'Room'
require_relative 'monster'

class MonsterRoom < Room
  def initialize(hidden = true, input = Monster.new)
    super(hidden, input)
    @description = 'This room contain a hideous monster'
  end

  def action(hero)
    @device.print_monster(input)
    @device.print_hero(hero)

    #TODO : Combat
  end
end
