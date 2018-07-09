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
      @device.next_line
      print_items
      input = @device.input
      break if is_valid? input
    end
    input
  end

  private

  def print_items
    @items.each_with_index do |item, index|
      @device.print_string "#{index} "
      @device.print_item item
      @device.next_line
    end
  end

  def is_valid?(input)
    input.between(0, @items.size-1)
  end
end
