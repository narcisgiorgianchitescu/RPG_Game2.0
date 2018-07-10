binpath = File.dirname(__FILE__)
$LOAD_PATH.unshift File.expand_path(File.join(binpath, '..'))
require 'position'

class Cursor
  attr_accessor :position
  def initialize(position)
    @position = position
  end

  def move(direction, how_much_moves = 1)
    row, column = self.next(direction, how_much_moves)
    @position.row = row
    @position.column = column
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

    operations[direction].call
  end
end
