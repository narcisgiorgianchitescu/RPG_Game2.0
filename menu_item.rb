require_relative 'menu'

# class that receives a list of options and prompts the io to choose one
class ItemMenu < Menu
  private

  def print_values
    @items.each_with_index do |item, index|
      string = "#{index} #{item.name} #{item.stats.attack} attack, "
      string += "#{item.stats.defence} defence, #{item.stats.hp} hp,"
      string += "#{item.stats.coins} coins"
      @device.print_string string
      @device.next_line
      super
    end
  end
end

#Old code
=begin
require_relative 'iointerface'

# class that receives a list of options and prompts the io to choose one
class ItemMenu
  def initialize(items, description, device)
    @description = description
    @items = items
    @device = device
  end

  def choice
    input = nil
    loop do
      @device.print_string description
      print_items
      input = @device.input
      break if valid? input
    end
    input
  end

  private

  def print_items
    @items.each_with_index do |item, index|
      string = "#{index} #{item.name} #{item.stats.attack} attack, "
      string += "#{item.stats.defence} defence, #{item.stats.hp} hp,"
      string += "#{item.stats.coins} coins"
      @device.print_string string
    end
  end

  def valid?(input)
    input.between(0, @items.size - 1)
  end
end
=end
