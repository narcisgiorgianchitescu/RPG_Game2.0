require_relative 'Room'

class MonsterRoom < Room
  def initialize(hidden = true, input = [])
    super(hidden, input)
    @description = 'This room contain a hideous monster'
  end

  def action
    super
  end
end
