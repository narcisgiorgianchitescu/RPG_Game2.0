binpath = File.dirname(__FILE__)
$LOAD_PATH.unshift File.expand_path(File.join(binpath, '..'))
require 'require_file'
require 'wearable'
require 'weapon'
require 'room'
require 'hero'
require 'io_terminal'

class Vault < Room
  attr_accessor :already_chose
  attr_accessor :got_item

  def initialize(hidden = true, input = [Wearable.new(), Weapon.new()])
    super(hidden, input)
    @description = 'You can chose one item from this vault'
    @got_item = false
    @already_chose = 'You already got you item at this vault'
  end

  def action(hero)
    return you_already_chose if @got_item

    prezent_option(hero)
  end

  def you_already_chose
    @device.print_string(@already_chose)

    @game_on
  end

  def give_item(hero, input)
    give_item_to_hero(hero, input)

    hero_chose_item

    output(hero)
  end

  def hero_chose_item
    @got_item = true
  end

  def output(hero)
    return @game_over if hero.stats.hp < 1

    @game_on
  end

  private

  def prezent_option(hero)
    menu = get_menu(@description, @no_value)
    input = menu.choice

    return @game_on if input == menu.exit_value

    give_item(hero, input)
  end
end

# s = Vault.new
# d = IOterminal.new
# s.set_device(d)
# h = Hero.new

# s.action(h)
