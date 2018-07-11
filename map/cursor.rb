binpath = File.dirname(__FILE__)
$LOAD_PATH.unshift File.expand_path(File.join(binpath, '..'))
require 'require_file'
require 'position'

# class that has a position which can be changed
class Cursor
  OPERATIONS = {
    'w' => ->(pos, dist) { [pos.row - dist, pos.column] },
    'up' => ->(pos, dist) { [pos.row - dist, pos.column] },
    'd' => ->(pos, dist) { [pos.row, pos.column + dist] },
    'right' => ->(pos, dist) { [pos.row, pos.column + dist] },
    's' => ->(pos, dist) { [pos.row + dist, pos.column] },
    'down' => ->(pos, dist) { [pos.row + dist, pos.column] },
    'a' => ->(pos, dist) { [pos.row, pos.column - dist] },
    'left' => ->(pos, dist) { [pos.row, pos.column - dist] }
  }.freeze
  attr_accessor :position
  def initialize(position)
    @position = position
  end

  def move(direction, how_much_moves = 1)
    position = self.next(direction, how_much_moves)
    @position.row = position.row
    @position.column = position.column
    @position
  end

  def next(direction, how_much_moves = 1)
    row, column = OPERATIONS[direction].call(position, how_much_moves)
    Position.new(row, column)
  end
end
