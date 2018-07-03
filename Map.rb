require_relative "Room"
require_relative "Hero"

class Map
  attr_accessor :size
  def initialize size = 10
    @size = size
    create_map size
  end

  def add_room room, position
    @slots[position.first][position.last] = room
  end

  def create_map size
    @slots = Array.new(size){Array.new(size)}
    size.times do |i|
      size.times do |j|
        @slots[i][j] = Room.new
      end
    end
  end

  def print_slot slot
    if slot.hidden
      print "   "
    else
      print " #{slot.class.to_s[0]} "
    end
    print "|"
  end

  def show hero
    puts " -"*@size*2
    @size.times do |i|
      print "|"
      @size.times do |j|
        if i == hero.position.first and j == hero.position.last
          print " X |"
        else
          current_slot = @slots[i][j]
          print_slot current_slot
        end
      end
      puts
      puts " -"*@size*2
    end
  end

  def do_action hero
    @slots[hero.position.first][hero.position.last].action hero
  end

end
