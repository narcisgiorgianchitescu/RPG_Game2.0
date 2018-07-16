require_relative 'Room'
require_relative 'Monster'
require_relative 'Combat'
require_relative 'System_Commands'

class Lair < Room
  include SystemCommands

  def initialize(monster = Monster.new)
    @monster = monster
    super
  end

  def show
    SystemCommands.clear_screen
    puts 'Lair. Room that contains a hideous monster.'
    puts 'Please be careful, the monster has the folowing stats:'
    puts ''
    @monster.show_stats
    puts ''
  end

  def action(hero)
    @hidden = false
    show
    puts 'The hero has the folowing stats:'
    puts ''
    hero.show_stats
    puts ''

    puts 'Press a key and tap enter to start combat.'
    gets

    Combat.new.fight(hero, @monster)
  end
end
