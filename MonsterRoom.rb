require_relative 'Room'
require_relative 'monster'

class MonsterRoom < Room
  def initialize(hidden = true, input = Monster.new)
    super(hidden, input)
    @description = 'This room contain a hideous monster'
  end

  def action
    super
  end
end
