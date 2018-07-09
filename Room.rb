class Room
  attr_accessor :hidden
  attr_accessor :input
  attr_accessor :description

  def initialize(hidden = true, input = [])
    @hidden = hidden
    @input = input
    @description = 'An empty room'
  end

  def action
    [@description, @input]
  end
end
