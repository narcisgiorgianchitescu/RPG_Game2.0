binpath = File.dirname(__FILE__)
$LOAD_PATH.unshift File.expand_path(File.join(binpath, '..'))
require 'require_file'
require 'monster'
require 'room'
require 'combat'

# Room that contains a terrible monster
class MonsterRoom < Room
  def initialize(hidden = true, input = Monster.new)
    super(hidden, input)
    @description = 'This room contain a hideous monster'
    @input = Monster.new if @input.class != Monster
  end

  def action(hero)
    super

    return fight(hero) if @input.stats.hp > 0

    monster_is_dead
  end

  def fight(hero)
    Combat.new(hero, @input, @device).fight
  end

  def monster_is_dead
    @device.clear
    @device.print_string('The monster is dead')
    @device.input
    @game_on
  end
end
