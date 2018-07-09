require_relative 'Room'

class Vault < Room
  attr_accessor :already_chose

  def initialize(hidden = true, input = [Item.new({}), Item.new({})])
    super(hidden, input)
    @description = 'You can chose one item from this vault'
    @got_item = false
    @already_chose = 'You already got you item at this vault'
  end

  def action(hero)
    return [@already_chose] if @got_item
    
    prezent_option(hero, true)
  end

  def prezent_option(hero, valid)
    @device.clear
    @device.print_string(@description)
    @device.print_string(@exit_option)

    @input.each_with_index do |item, index|
      @device.print_string((index + @index_correction).to_s)
      @device.print_item(item)
    end

    @device.print_string('Invalid input') unless valid
    
    check_for_valid_input(hero)
  end

  def check_for_valid_input(hero)
    valid_input = [0..@input.size]
    input = @device.input.chomp
    
    prezent_option(hero, false) unless valid_input === input

    give_item(hero, input) if input > 0
  end

  def give_item(hero, input)
    hero.use_item(@input[input - @index_correction])

    @got_item = true
  end
end
