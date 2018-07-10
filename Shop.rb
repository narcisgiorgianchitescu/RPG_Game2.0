require_relative 'Room'
require_relative 'Item'
require_relative 'menu_item'

class Shop < Room
  attr_accessor :out_of_items

  def initialize(hidden = true, input = [Item.new({}), Item.new({})])
    super(hidden, input)
    @description  = 'Shop is open, have a look.'
    @out_of_items = 'Shop is out of items'
    @menu_item = ItemMenu.new(@input, @description, @device)
  end

  def action(hero)
    @device.print_string(@out_of_items) if out_of_items?
    return if out_of_items?

    start_business(hero, true)
  end

  def out_of_items?
    input.size == 0
  end

  def start_business(hero, valid)
    @menu_item.choice
  end

  def do_business(hero, input)
    cost = @input[input - @index_correction].stats.coins
    if hero.has_enough_money?(cost)
      hero.use_item(@input[input - @index_correction])
      @input.delete_at(input - @index_correction)
    else
      @device.puts_string("Hero doesn't have enough money!")
    end
    start_business(hero, true)
  end
end
