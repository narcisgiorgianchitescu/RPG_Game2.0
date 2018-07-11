binpath = File.dirname(__FILE__)
$LOAD_PATH.unshift File.expand_path(File.join(binpath, '..'))
require 'require_file'
require 'monster'
require 'room'
require 'combat'

class MonsterRoom < Room
  def initialize(hidden = true, input = Monster.new)
    super(hidden, input)
    @description = 'This room contain a hideous monster'
  end

  def action(hero)
    Combat.new(hero, input, @device).fight

    return @game_over if hero.stats.hp < 1

    @game_on
  end
end

# mr = MonsterRoom.new
# d = IOterminal.new
# mr.set_device(d)
# h = Hero.new

# mr.action(h)
