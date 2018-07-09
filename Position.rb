class Position
  attr_accessor :coordinates

  def initialize(row = 0, column = 0)
    @coordinates = [row, column]
  end

  def self.coordinates
    @coordinates
  end

  def move_up
    @coordinates[0] -= 1
    self
  end

  def move_down
    @coordinates[0] += 1
    self
  end

  def move_left
    @coordinates[1] -= 1
    self
  end

  def move_right
    @coordinates[1] += 1
    self
  end

  def next_up
    [@coordinates[0] - 1, @coordinates[1]]
  end

  def next_down
    [@coordinates[0] + 1, @coordinates[1]]
  end

  def next_left
    [@coordinates[0], @coordinates[1] - 1]
  end

  def next_right
    [@coordinates[0], @coordinates[1] + 1]
  end
end
