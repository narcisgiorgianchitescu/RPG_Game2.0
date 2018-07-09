require_relative 'Room'

class Vault < Room
  attr_accessor :already_chose

  def initialize(hidden = true, input = [Item.new({}), Item.new({})])
    super(hidden, input)
    @description = 'You can chose one item from this vault'
    @got_item = false
    @already_chose = 'You already got you item at this vault'
  end

  def action
    return [@already_chose] if @got_item

    @got_item = true
    super
  end
end
