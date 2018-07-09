require_relative 'Room'

class Shop < Room
  attr_accessor :out_of_items

  def initialize(hidden = true, input = [])
    super(hidden, input)
    @description  = 'Shop is open, have a look'
    @out_of_items = 'Shop is out of items'
  end

  def action
    return @out_of_items if out_of_items?

    super
  end

  def out_of_items?
    input.size == 0
  end
end
