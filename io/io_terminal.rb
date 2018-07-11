binpath = File.dirname(__FILE__)
$LOAD_PATH.unshift File.expand_path(File.join(binpath, '..'))
require 'require_file'
require 'item'
require 'monster'
require 'hero'
require 'io_interface'
require 'wearable'
require 'map'
require 'cursor'
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

  def print_map(map, cursor)
    show(map, cursor)
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

  def print_slot(slot, cursor, i , j)
    if slot.hidden
      if i == cursor.position.row and j == cursor.position.column
        print ' X '
      else
        print '   '
      end
    else
      if i == cursor.position.row and j == cursor.position.column
        print ' X '
      else
        print first_letter_of_class(slot)
      end
    end
    print '|'
  end

  def show(map, cursor)
    puts ' -' * map.size * 2
    map.slots.each_with_index do |line, line_index|
      print_line(line, line_index, cursor)
      puts ' -' * map.size * 2
    end
  end

  def print_line(line, line_index, cursor)
    print '|'
    line.each_with_index do |slot, col_index|
      print_slot slot, cursor, line_index, col_index
    end
    puts
  end
end
