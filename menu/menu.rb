binpath = File.dirname(__FILE__)
$LOAD_PATH.unshift File.expand_path(File.join(binpath, '..'))
require 'require_file'
require 'io_interface'

# class that receives a list of options and prompts the io to choose one
class Menu
  attr_accessor :exit_value
  def initialize(values, description, device)
    @description = description
    @values = values
    @device = device
    @exit_value = -1
  end

  def choice
    input = nil
    loop do
      @device.clear
      @device.print_string @description
      @device.next_line
      print_values
      input = @device.input.to_i
      break if valid? input
    end
    input
  end

  private

  def print_values
    @values.each_with_index do |string_option, index|
      @device.print_string "#{index}: #{string_option}"
      @device.next_line
    end
    @device.print_string("Press #{@exit_value} to exit")
    @device.next_line
  end

  def valid?(input)
    ([0, 1].to_a.include? input || (input == @exit_value))
  end
end
