binpath = File.dirname( __FILE__ )
$LOAD_PATH.unshift File.expand_path(File.join(binpath, '..'))
require 'require_file'

class Hospital < Room
  def initialize(hidden = true, input = nil)
    heal_price_options = [[5, 5], [10, 9], [20, 17]]
    super(hidden, heal_price_options) unless input
    super(hidden, input) if input
    @description = 'Hospital, you can heal wounds here'
  end

  def action(hero)
    prezent_heal_option(hero, true)
  end

  def prezent_heal_option(hero)
    @device.clear
    @device.print_string(@description)
    @device.print_string(@exit_option)

    @input.each_with_index do |item, index|
      string = "#{index + @index_correction}. #{input[index].first} for"
      string += " #{input[index].last} coins"
      @device.print_string(string)
    end

    @device.print_string('Invalid input') unless valid

    check_for_valid_input(hero)
  end

  def check_for_valid_input(hero)
    valid_input = [0..@input.size]
    input = @device.input.chomp

    prezent_heal_option(hero, false) unless valid_input === input

    heal_hero(hero, input) if input > 0
  end

  def heal_hero(hero, input)
    if hero.has_enough_money?(@input[input].last)
      hero.stats.hp += @input[input].first
      hero.stats.money -= @input[input].last
    else
      @device.print_string("Hero doesn't have enough money!")
    end
    prezent_heal_option(hero, true)
  end
end
