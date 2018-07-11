# encapsulates a row/column pair
class Position
  attr_accessor :row, :column
  def initialize(row = 0, column = 0)
    @row = row
    @column = column
  end
end
