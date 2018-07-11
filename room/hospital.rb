binpath = File.dirname(__FILE__)
$LOAD_PATH.unshift File.expand_path(File.join(binpath, '..'))
require 'require_file'
require 'room'
require 'hero'
require 'io_terminal'

# Allows a hero to heal his hp
class Hospital < Room
  def initialize(hidden = true, input = nil)
    heal_price_options = [[5, 5], [10, 9], [20, 17]]
    super(hidden, heal_price_options) unless input
    super(hidden, input) if input
    @description = 'Hospital, you can heal wounds here'
    @insufficient_funds = 'Not enough money for that heal option'
    @options = from_array_of_pairs_to_array
  end

  def action(hero)
    super
    get_input(@description, hero)
  end

  # TODO: tot ce e sub ar trebui sa fie private?

  def from_array_of_pairs_to_array
    @input.map { |pair| "#{pair.first} hp for #{pair.last} coins" }
  end

  def heal_hero(hero, input)
    hero.stats.hp += @input[input].first
  end

  def take_money_from_hero(hero, input)
    hero.stats.coins -= @input[input].last
  end

  private

  def get_input(description, hero)
    menu = Menu.new(@options, hero.description + "\n" + description, @device)
    input = menu.choice
    return @game_on if input == menu.exit_value
    enough_money = hero.enough_money?(@input[input].last)
    proceed_with_healing(hero, input) if enough_money
    get_input(@insufficient_funds, hero) unless enough_money
  end

  def proceed_with_healing(hero, input)
    heal_hero(hero, input)
    take_money_from_hero(hero, input)
    get_input(@description, hero)
  end
end
