require_relative 'Room'
require_relative 'Hero'
require_relative 'Item'
require_relative 'System_Commands'
require_relative 'Check_Commands'

class Vault < Room
  include SystemCommands
  include CheckCommands

  def initialize(items = [])
    @items = items
    @got_item = false
    super
  end

  def show
    SystemCommands.clear_screen
    puts 'Chose one item from the vault :'
    puts '0 to exit'

    @items.each_with_index do |item, index|
      print "#{index + @index_correction} "
      item.show(false)
      puts ''
    end
  end

  def action(hero)
    if @got_item then
      SystemCommands.clear_screen
      puts 'You already chose your item at this vault.'
      SystemCommands.wait_for_input
      return
    end

    @hidden = false
    option = @WAIT_FOR_INPUT

    until option == @EXIT or @got_item
      show()
      puts "\nYou have:\n\n"
      hero.show_stats

      option = gets.chomp.to_i
      check_option(option,hero)
    end
  end

  def check_option(option, hero)
    super

    if CheckCommands.check_if_between(
        [0, @items.size],
        option - @index_correction) then
      give_item_to_hero(hero, @items[option - @index_correction])
      @got_item = true
      return
    else
      puts "We don't have that option."
    end
  end

  def give_item_to_hero(hero, item)
    hero.use_item(item)

    show_item(hero)
  end

  def show_item(hero)
    SystemCommands.clear_screen
    hero.show_stats
    SystemCommands.wait_for_input
  end
end
