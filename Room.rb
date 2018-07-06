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
    #nothing
  end

  def get_hidden
    @hidden
  end

  def set_hidden(hidden)
    @hidden = hidden
  end

  def get_input
    @input
  end

  def set_input(input)
    @input = input
  end

  def get_room_description
    @description
  end
end
