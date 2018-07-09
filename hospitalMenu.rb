require_relative 'iointerface'

# class that receives a list of options and prompts the io to choose one
class HospitalMenu
  def initialize(heal_options, description, device)
    @description = description
    @heal_options = heal_options
    @device = device
  end

  def choice
    input = nil
    loop do
      @device.print_string description
      print_heal_options
      input = @device.input
      break if valid? input
    end
    input
  end

  private

  def print_heal_options
    @heal_options.each do |item|
      string = "#{item[0]} hp for #{item[0]} coins"
      @device.print_string string
    end
  end

  def valid?(input)
    input.between(0, @heal_options.size - 1)
  end
end
