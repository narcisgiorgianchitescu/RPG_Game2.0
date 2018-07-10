binpath = File.dirname(__FILE__)
$LOAD_PATH.unshift File.expand_path(File.join(binpath, '..'))
require 'require_file'
require 'position'

class Cursor
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
    operations = {}
    operations['w'] = -> { [@position.row - how_much_moves, @position.column]}
    operations['up'] = -> { [@position.row - how_much_moves, @position.column]}

    operations['d'] = -> { [@position.row, @position.column + how_much_moves]}
    operations['right'] = -> { [@position.row, @position.column + how_much_moves]}

    operations['s'] = -> { [@position.row + how_much_moves, @position.column]}
    operations['down'] = -> { [@position.row + how_much_moves, @position.column]}

    operations['a'] = -> { [@position.row, @position.column - how_much_moves]}
    operations['left'] = -> { [@position.row, @position.column - how_much_moves]}

    row, column = operations[direction].call
    Position.new(row, column)
  end
end
