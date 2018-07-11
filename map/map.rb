binpath = File.dirname(__FILE__)
$LOAD_PATH.unshift File.expand_path(File.join(binpath, '..'))
require 'require_file'
require 'room'
require 'position'

# class for creating and modifying a map
class Map
  attr_accessor :size, :slots
  def initialize(size = 10)
    @size = size
    @slots = create_map(size)
  end

  def room(position)
    check_position(position)
    @slots[position.row][position.column]
  end

  def add_room(room, position)
    check_position(position)
    check_valid_room(room)
    @slots[position.row][position.column] = room
  end

  def clear_room(position)
    check_position(position)
    @slots[position.row][position.column] = Room.new
  end

  def valid_position?(position)
    position.row.between?(0, @size - 1) &&
      position.column.between?(0, @size - 1)
  end

  private

  def check_position(position)
    raise 'Invalid input' unless valid_position?(position)
  end

  def check_valid_room(room)
    raise 'Invalid input' unless room.is_a? Room
  end

  def create_map(size)
    @slots = Array.new(size) { Array.new(size) }
    size.times do |i|
      size.times  do |j|
        @slots[i][j] = Room.new
      end
    end
    @slots
  end
end
