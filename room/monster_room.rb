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
    Combat.new(hero, @input, @device).fight
  end
end
