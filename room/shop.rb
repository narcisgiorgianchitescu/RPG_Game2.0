binpath = File.dirname(__FILE__)
$LOAD_PATH.unshift File.expand_path(File.join(binpath, '..'))
require 'require_file'
require 'menu'
require 'wearable'
require 'room'
require 'hero'
require 'io_terminal'
require 'weapon'

# Has some items and the hero can buy them
class Shop < Room
  attr_accessor :out_of_items

  def initialize(hidden = true, input = [Wearable.new, Weapon.new])
    super(hidden, input)
    @description  = 'Shop is open, have a look.'
    @out_of_items = 'Shop is out of items'
    @not_enough_money = 'Not enough money, have another look'
  end

  def action(hero)
    super
    return no_items if out_of_items?

    prezent_wares(hero, @description)
  end

  def out_of_items?
    input.empty?
  end

  def no_items
    @device.print_string(@out_of_items)
    @game_on
  end

  def recalculate_supply(input)
    @input.delete_at(input)
  end

  private

  def prezent_wares(hero, description)
    menu = get_menu(hero.description + "\n" + description, @show_value)

    input = menu.choice

    return @game_on if input == menu.exit_value

    enough_money = hero.enough_money?(@input[input].stats.coins)

    do_business(hero, input) if enough_money

    prezent_wares(hero, @not_enough_money) unless enough_money
  end

  def do_business(hero, input)
    give_item_to_hero(hero, input)

    return @game_over if hero.stats.hp < 1

    take_money(hero, input)

    recalculate_supply(input)

    action(hero)
  end
end
