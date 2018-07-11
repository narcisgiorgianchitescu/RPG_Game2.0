binpath = File.dirname(__FILE__)
$LOAD_PATH.unshift File.expand_path(File.join(binpath, '..'))
require 'require_file'
require 'menu'
require 'wearable'
require 'room'
require 'hero'
require 'io_terminal'
require 'weapon'

class Shop < Room
  attr_accessor :out_of_items

  def initialize(hidden = true, input = [Wearable.new(), Weapon.new()])
    super(hidden, input)
    @description  = 'Shop is open, have a look.'
    @out_of_items = 'Shop is out of items'
    @not_enough_money = 'Not enough money, have another look'
  end

  def action(hero)
    return out_of_items if out_of_items?

    start_business(hero, @description)
  end

  def out_of_items?
    input.size == 0
  end

  def out_of_items
    @device.print_string(@out_of_items)
    @game_on
  end

  def recalculate_supply(input)
    @input.delete_at(input)
  end

  private

  def start_business(hero, description)
    input = get_input(description)

    return @game_on if input == item_menu.exit_value

    enough_money = hero.enough_money?(@input[input].stats.coins)

    commence_business(hero, input) if enough_money

    start_business(hero, @not_enough_money) unless enough_money
  end

  def commence_business(hero, input)
    give_item_to_hero(hero, input)

    take_money(hero, input)

    recalculate_supply(input)

    action(hero)
  end
end

# s = Shop.new(true, [])
# d = IOterminal.new
# s.set_device(d)
# h = Hero.new

# s.action(h)
