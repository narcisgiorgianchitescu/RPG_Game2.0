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
    @device.print_string(@out_of_items) if out_of_items?
    @device.next_line if out_of_items?
    return if out_of_items?

    start_business(hero, @description)
  end

  def out_of_items?
    input.size == 0
  end

  def start_business(hero, description)
    items_description = items_description(@input, @show_value)
    item_menu = Menu.new(items_description, description, @device)
    input = item_menu.choice

    return if input == item_menu.exit_value

    enough_money = hero.has_enough_money?(@input[input].stats.coins)

    restart_business(hero, input) if enough_money

    start_business(hero, @not_enough_money) unless enough_money
  end

  def restart_business(hero, input)
    give_item_to_hero(hero, input)

    take_money(hero, input)

    recalculate_supply(input)

    action(hero)
  end

  def give_item_to_hero(hero, input)
    hero.use_item(@input[input])
  end

  def take_money(hero, input)
    hero.stats.coins -= @input[input].stats.coins
  end

  def recalculate_supply(input)
    @input.delete_at(input)
  end
end

#s = Shop.new
#d = IOterminal.new
#s.set_device(d)
#h = Hero.new

#s.action(h)
