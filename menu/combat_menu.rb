binpath = File.dirname(__FILE__)
$LOAD_PATH.unshift File.expand_path(File.join(binpath, '..'))
require 'require_file'
require 'menu'

# class that receives a list of options and prompts the io to choose one
class CombatMenu < Menu
  def initialize(number_of_options, description, device)
    #number of options can be modified with a hash / array
    super(number_of_options ,description, device)
  end

  private

  def print_values
    string = 'Press 1 to attack, 2 to defend'
    @device.print_string string
  end

  def valid?(input)
    input.between(0, @values - 1)
  end
end
