require_relative

class Position
  def initialize(row, column, entity_on_surface)
    @coordinates = [row, column]
    @entity = entity_on_surface
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
