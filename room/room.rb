binpath = File.dirname(__FILE__)
$LOAD_PATH.unshift File.expand_path(File.join(binpath, '..'))
require 'require_file'
require 'item'

class Room
  attr_accessor :hidden
  attr_accessor :input
  attr_accessor :description

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

  def action(hero)
    @device.print_string(@description)
    @game_on
  end

  def set_device(device)
    @device = device
  end

  def items_description(items, value)
    arr = []
    items.map do |item|

      without_value = "#{item.name}, #{item.stats.attack} attack,"
      without_value += " #{item.stats.defence} defence, #{item.stats.hp} hp"

      with_value = "#{without_value} for #{item.stats.coins} coins"

      arr.push(with_value) if value
      arr.push(without_value) unless value
    end

    arr
  end
end
