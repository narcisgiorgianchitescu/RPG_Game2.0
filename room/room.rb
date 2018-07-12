binpath = File.dirname(__FILE__)
$LOAD_PATH.unshift File.expand_path(File.join(binpath, '..'))
require 'require_file'
require 'item'
require 'menu'
require 'hero'
require 'io_terminal'

# generic room
class Room
  attr_accessor :hidden
  attr_accessor :input
  attr_accessor :description
  attr_accessor :device

  def initialize(hidden = true, input = [])
    @hidden = hidden
    @input = input
    @description = 'An empty room'
    @device = nil
    @game_over = true
    @game_on = false

    @show_value = true
    @no_value = false
  end

  def action(_hero)
    @hidden = false
    @game_on
  end

  def set_device(device)
    @device = device
  end

  def items_description(items, value)
    items.map { |item| item.description(value).chomp }
  end

  def give_item_to_hero(hero, input)
    hero.use_item(@input[input])
  end

  def take_money(hero, input)
    hero.stats.coins -= @input[input].stats.coins
  end

  private

  def get_menu(description, show_value)
    items_description = items_description(@input, show_value)
    item_menu = Menu.new(items_description, description, @device)
    item_menu
  end
end
