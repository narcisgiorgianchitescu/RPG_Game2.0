binpath = File.dirname(__FILE__)
$LOAD_PATH.unshift File.expand_path(File.join(binpath, '..'))
require 'require_file'
require 'io_interface'

# class that receives a list of options and prompts the io to choose one
class Menu
  def initialize(values, description, device)
    @description = description
    @values = values
    @device = device
  end

  def choice
    input = nil
    loop do
      @device.print_string description
      print_values
      input = @device.input
      break if valid? input
    end
    input
  end

  private

  def print_values; end

  def valid?(input)
    input.between(0, @values.size - 1)
  end
end
