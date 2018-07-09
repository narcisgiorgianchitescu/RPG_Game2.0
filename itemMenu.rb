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
      device.print_string description
      device.next_line
      @items.each_with_index do |item, index|
        device.print_string "#{index} "
        device.print_item item
        device.next_line
      end
      input = device.input
      break if is_valid? input
    end
    input
  end
end
