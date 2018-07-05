require_relative 'Room'
require_relative 'Hero'
require_relative 'Item'
require_relative 'System_Commands'
require_relative 'Check_Commands'

class Shop < Room
  include SystemCommands
  include CheckCommands

  def initialize(items = [])
    @items = items
    super
  end

  def show
    SystemCommands.clear_screen
    puts "Shop's open. Have a look :"
    puts '0 to exit'

    @items.each_with_index do |item, index|
      print "#{index + @index_correction} "
      item.show(true)
      puts
    end

    puts "You don't have enough money." unless @has_money
  end

  def action(hero)
    @hidden = false

    if @items.size < 1 then
      puts 'No more items to sell.'
      return
    end

    option = @WAIT_FOR_INPUT
    until option == @EXIT
      show()
      puts ''
      hero.show_stats
      option = gets.chomp.to_i
      check_option(option,hero)
      end
  end
 
  def check_option(option,hero)
    super(option, hero)

    if CheckCommands.check_if_between(
        [0, @items.size],
        option - @index_correction) then
      we_have_that_option(option, hero)
    else
      @has_money = true
      puts "We don't have that option."
    end
  end

  def we_have_that_option(option, hero)
    if CheckCommands.check_if_buyer_has_enough_money(
        hero,
        @items[option - @index_correction].value) then
      give_item_to_hero(hero, @items[option - @index_correction])

      delete_item_from_list_at(option - @index_correction)

      @has_money = true
    else
      @has_money = false
      puts 'Not enough money'
    end
  end

  def give_item_to_hero(hero, item)
    hero.use_item(item)
    hero.money -= item.value
  end

  def delete_item_from_list_at(poz)
    @items.delete_at(poz)
  end
end
