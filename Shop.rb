require_relative 'Room'

class Shop < Room
  def initialize(hidden = true, input = [])
    super(hidden, input)
    @description = 'Shop is open, have a look'
  end

  def action
    #nothing for now
  end
end
