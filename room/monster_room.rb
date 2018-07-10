binpath = File.dirname(__FILE__)
$LOAD_PATH.unshift File.expand_path(File.join(binpath, '..'))
require 'require_file'
require 'monster'
require 'room'

class MonsterRoom < Room
  def initialize(hidden = true, input = Monster.new)
    super(hidden, input)
    @description = 'This room contain a hideous monster'
  end

  def action(hero)
    @device.print_monster(input)
    @device.print_hero(hero)

    # TODO : Combat
  end
end
