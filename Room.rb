class Room
  attr_accessor :hidden
  attr_accessor :input
  attr_accessor :description

  def initialize(hidden = true, input = [])
    @hidden = hidden
    @input = input
    @description = 'An empty room'
    @device = nil
    @win = true
    @lose = false
  end

  def action(hero)
    @device.print_string(@description)
  end

  def set_device(device)
    @device = device
  end
end
