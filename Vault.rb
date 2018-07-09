require_relative 'Room'

class Vault < Room
  def initialize(hidden = true, input = [])
    super(hidden, input)
    @description = 'You can chose one item from this vault'
  end

  def action
    #nothing for now
  end
end
