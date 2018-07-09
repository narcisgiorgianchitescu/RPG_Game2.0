require_relative 'Room'

class Hospital < Room
  def initialize(hidden = true, input = [[5, 5], [10, 9], [20, 17]])
    super(hidden, input)
    @description = 'Hospital, you can heal wounds here'
  end

  def action
    super
  end
end
