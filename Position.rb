require_relative

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
end
