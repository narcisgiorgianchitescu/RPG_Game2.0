require_relative 'Room'

class WinRoom < Room
  def initialize(hidden = true, input = [])
    super(hidden, input)
    @description = 'Get here to win'
  end

  def action
    #nothing for now
  end
end
