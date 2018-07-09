require_relative 'Room'
require_relative 'Item'

class Shop < Room
  attr_accessor :out_of_items

  def initialize(hidden = true, input = [Item.new({}), Item.new({})])
    super(hidden, input)
    @description  = 'Shop is open, have a look.'
    @out_of_items = 'Shop is out of items'
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
    @device.clear
    @device.print_string(@description)
    @device.print_string(@exit_option)

    @input.each_with_index do |item, index|
      @device.print_string((index + @index_correction).to_s)
      @device.print_item(item)
    end

    @device.print_string('Invalid input') unless valid

    check_for_valid_input(hero)
  end

  def check_for_valid_input(hero)
    valid_input = [0..@input.size]
    input = @device.input.chomp
    
    start_business(hero, false) unless valid_input === input

    do_business(hero, input) if input > 0
  end

  def do_business(hero, input)
    hero.use_item(@input[input - @index_correction])

    recalculate_supply(input)
  end

  def recalculate_supply(input)
    @input.delete_at(input - @index_correction)

    start_business(hero, true)
  end
end
