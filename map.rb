require_relative 'Room'

# class for creating and modifying a map
class Map
  attr_accessor :size, :slots
  def initialize(size = 10)
    @size = size
    @slots = create_map(size)
  end

  def room(row, column)
    check_position(row, column)
    @slots[row][column]
  end

  def add_room(room, row, column)
    check_position(row, column)
    check_valid_room(room)
    @slots[row][column] = room
  end

  def clear_room(row, column)
    check_position(row, column)
    @slots[row][column] = nil
  end

  def valid_position?(row, column)
    row.between?(0, @size - 1) && column.between?(0, @size - 1)
  end

  private

  def check_position(row, column)
    raise 'Invalid input' unless row.between?(0, @size - 1) &&
                                 column.between?(0, @size - 1)
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

m = Map.new
