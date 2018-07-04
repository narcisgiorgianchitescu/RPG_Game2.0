require_relative 'Room'
require_relative 'Hero'

# class for using a game map
class Map
  attr_accessor :size
  attr_accessor :slots
  def initialize(size = 10)
    @size = size
    create_map size
  end

  def add_room(room, position)
    @slots[position.first][position.last] = room
  end

  def create_map(size)
    @slots = Array.new(size) { Array.new(size) }
    size.times do |i|
      size.times do |j|
        @slots[i][j] = Room.new
      end
    end
  end

  def clear_room(position)
    @slots[position.first][position.last] = Room.new false
  end

  def print_slot(slot)
    if slot.hidden
      print '   '
    else
      print " #{slot.class.to_s[0]} "
    end
    print '|'
  end

  def hero_slot?(hero, position)
    hero.position.first == position.first && hero.position.last == position.last
  end

  def print_line(line, hero_position, has_hero = false)
    print '|'
    line.each_with_index do |slot, index|
      if has_hero && hero_position == index
        print ' X |'
      else
        print_slot slot
      end
    end
    puts
  end

  def show(hero)
    puts ' -' * @size * 2
    @slots.each_with_index do |line, index|
      has_hero = (index == hero.position.first)
      print_line line, hero.position.last, has_hero
      puts ' -' * @size * 2
    end
  end

  def do_action(hero)
    @slots[hero.position.first][hero.position.last].action hero
  end
end
