class Position
  def initialize(row, column)
    @coordinates = [row, column]
  end

  def move_up
    @coordinates[0] -= 1
  end

  def move_down
    @coordinates[0] += 1
  end

  def move_left
    @coordinates[1] -= 1
  end

  def move_right
    @coordinates[1] += 1
  end

  def next_up
    [coordinate[0] - 1, coordinate[1]]
  end

  def next_down
    [coordinate[0] + 1, coordinate[1]]
  end

  def next_left
    [coordinate[0], coordinate[1] - 1]
  end

  def next_right
    [coordinate[0], coordinate[1] + 1]
  end
end
