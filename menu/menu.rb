binpath = File.dirname(__FILE__)
$LOAD_PATH.unshift File.expand_path(File.join(binpath, '..'))
require 'require_file'
require 'io_terminal'

# class that receives a list of options and prompts the io to choose one
class Menu
  attr_accessor :exit_value
  def initialize(values = [], description = ' ', device = nil)
    @description = description
    @values = values
    @device = device
    @exit_value = -1
  end

  def choice(clear_screen = true)
    @device.clear if clear_screen
    loop do
      print_description
      print_values
      @input = get_input
      break if valid?
      @device.clear
    end
    return_input
  end

  private

  def get_input
    @device.input.chomp
  end

  def print_description
    @device.print_string @description
    @device.next_line
  end

  def return_input
    print_return_input = {}
    print_return_input['Array'] = -> { @input.to_i }
    print_return_input['Hash'] = -> { @input }
    print_return_input[@values.class.name].call
  end

  def print_values
    @values.each_with_index do |string_option, index|
      print_values_on_type(index, string_option)
    end
    string = "Press #{@exit_value} to exit"
    @device.print_string string if @values.class.name == 'Array'
    @device.next_line
  end

  def print_values_on_type(index, string_option)
    # TODO: change to class constant
    print_values_class = {}
    print_values_class['Array'] = -> { print_value_array(index, string_option)}
    print_values_class['Hash'] = -> { print_value_hash(string_option)}
    print_values_class[@values.class.name].call
  end

  def print_value_array(index, string_option)
    return unless string_option
    @device.print_string "#{index}. #{string_option}"
    @device.next_line
  end

  def print_value_hash(string_option)
    return unless string_option[1]
    @device.print_string "#{string_option[0]} #{string_option[1]}"
    @device.next_line
  end

  def valid?
    # TODO: change to class constant
    valids_class = {}
    valids_class['Array'] = -> { (-1..(@values.size - 1)).to_a.include? @input.to_i }
    valids_class['Hash'] = -> { is_in_hash_keys }
    valids_class[@values.class.name].call
  end

  def is_in_hash_keys
    @values.key?(@input.to_s.to_sym) || @values.key?(@input.to_s) || @values.key?(@input)
  end
end
