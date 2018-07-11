binpath = File.dirname(__FILE__)
$LOAD_PATH.unshift File.expand_path(File.join(binpath, '..'))
require 'require_file'
require 'io_terminal'

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
      input = @device.input
      break if valid? input
    end
    return_input(input)
  end

  private

  def return_input(input)
    print_return_input = {}
    print_return_input['Array'] = -> { input.to_i }
    print_return_input['Hash'] = -> { input }
    print_return_input[@values.class.name].call
  end

  def print_values
    @values.each_with_index do |string_option, index|
      print_values_on_type(index, string_option)
      @device.next_line
    end
    @device.print_string("Press #{@exit_value} to exit") if @values.class.name == 'Array'
    @device.next_line
  end

  def print_values_on_type(index, string_option)
    print_values_class = {}
    print_values_class['Array'] = -> { @device.print_string "#{index}. #{string_option}"}
    print_values_class['Hash'] = -> { @device.print_string "#{string_option[0]} #{string_option[1]}"}
    print_values_class[@values.class.name].call
  end

  def valid?(input)
    valids_class = {}
    valids_class['Array'] = -> { (-1..(@values.size - 1)).to_a.include? input.to_i }
    valids_class['Hash'] = -> { @values.has_key?(input.to_s.to_sym) || @values.has_key?("#{input}") || @values.has_key?(input.to_i) || @values.has_key?(input.to_s) || @values.has_key?(input) }
    valids_class[@values.class.name].call
  end
end

#device = IOterminal.new
#values = [1, 2, 3, 4]
#[1, 2, 3, 4]
#{ mihai: 'test', spanac: 'test2'}
#description = ' '
#puts Menu.new(values, description, device).choice.class.name
