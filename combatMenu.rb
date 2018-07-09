require_relative 'menu'

# class that receives a list of options and prompts the io to choose one
class CombatMenu < Menu
  def initialize(values, description, device)
    #values is number of options, maybe: hash with name of ability and index
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
