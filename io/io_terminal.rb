binpath = File.dirname(__FILE__)
$LOAD_PATH.unshift File.expand_path(File.join(binpath, '..'))
require 'require_file'
require 'item'
require 'monster'
require 'hero'
require 'io_interface'
require 'wearable'
require 'map'
# ...
class IOterminal < IOinterface
  def print_string(string)
    print string
  end

  def next_line
    print "\n"
  end

  def puts_string(string)
    print_string(string)
    next_line
  end

  def print_item(item)
    print_string("Itemul #{item.name} are: ")
    next_line
    print_stats(item.stats)
  end

  def print_monster(monster)
    print_string("Monstrul #{monster.name} are: ")
    next_line
    print_stats(monster.stats)
    next_line
  end

  def print_hero(hero)
    print_string("Eroul #{hero.name} are: ")
    next_line
    print_stats(hero.stats)
    next_line
    print_string("Head: #{hero.equipment.head.name}: ")
    next_line
    print_stats(hero.equipment.head.stats)
    next_line
    print_string("Chest: #{hero.equipment.chest.name}: ")
    next_line
    print_stats(hero.equipment.chest.stats)
    next_line
    print_string("Boots: #{hero.equipment.boots.name}: ")
    next_line
    print_stats(hero.equipment.head.stats)
    next_line
  end

  def clear
    system('cls') || system('clear')
  end

  def input
    gets
  end

  def print_map(map)
    show(map)
  end

  private

  def print_stats(stats)
    print_string("HP: #{stats.hp}")
    next_line
    print_string("Attack: #{stats.attack}")
    next_line
    print_string("Defence: #{stats.defence}")
    next_line
    print_string("Coins: #{stats.coins}")
    next_line
  end

  def first_letter_of_class(slot)
    " #{slot.class.to_s[0]} "
  end

  def print_slot(slot)
    if slot.hidden
      print '   '
    else
      print first_letter_of_class(slot)
    end
    print '|'
  end

  def show(map)
    puts ' -' * map.size * 2
    map.slots.each do |line|
      print_line(line)
      puts ' -' * map.size * 2
    end
  end

  def print_line(line)
    print '|'
    line.each do |slot|
      print_slot slot
    end
    puts
  end
end
