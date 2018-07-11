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
    puts_string(item.description)
  end

  def print_monster(monster)
    puts_string(monster.description)
  end

  def print_hero(hero)
    puts_string(hero.description)
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
    puts_string(stats.description)
  end

  def first_letter_of_class(slot)
    " #{slot.class.to_s[0]} "
  end

  def print_slot(slot, cursor, i, j)
    if slot.hidden
      if i == cursor.position.row && j == cursor.position.column
        print ' X '
      else
        print '   '
      end
    elsif i == cursor.position.row && j == cursor.position.column
      print ' X '
    else
      print first_letter_of_class(slot)
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
