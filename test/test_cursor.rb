binpath = File.dirname(__FILE__)
$LOAD_PATH.unshift File.expand_path(File.join(binpath, '..'))
require 'require_file'
require 'minitest/autorun'
require 'cursor'
require 'test/unit'

class TestPosition < Test::Unit::TestCase
  # Cursor are Positions -> row,column
  def setup; end

  def test_next_up
    cursor = Cursor.new(Position.new)
    assert_equal(
      cursor.position.row - 1,
      cursor.next('w').row
    )
  end

  def test_next_down
    cursor = Cursor.new(Position.new(5, 5))
    assert_equal(
      cursor.position.row + 1,
      cursor.next('s').row
    )

    assert_equal(
      cursor.position.column,
      cursor.next('s').column
    )
    assert_equal(
      cursor.position.row + 3,
      cursor.next('down', 3).row
    )
  end

  def test_next_right
    cursor = Cursor.new(Position.new(5, 5))
    assert_equal(
      cursor.position.row,
      cursor.move('d').row
    )
    assert_equal(
      cursor.position.column + 1,
      cursor.move('d').column
    )
    assert_equal(
      cursor.position.column + 3,
      cursor.move('right', 3).column
    )
  end

  def test_next_left
    cursor = Cursor.new(Position.new(5, 5))
    assert_equal(
      cursor.position.row,
      cursor.move('a').row
    )
    assert_equal(
      cursor.position.column - 1,
      cursor.move('a').column
    )
    assert_equal(
      cursor.position.column - 21,
      cursor.move('left', 21).column
    )
  end

  def test_move_up
    cursor = Cursor.new(Position.new(5, 5))
    assert_equal(
      cursor.position.row - 1,
      cursor.move('w').row
    )

    assert_equal(
      cursor.position.column,
      cursor.move('w').column
    )

    assert_equal(
      cursor.position.row - 3,
      cursor.move('up', 3).row
    )
  end

  def test_move_down
    cursor = Cursor.new(Position.new(5, 5))
    assert_equal(
      cursor.position.row + 1,
      cursor.move('s').row
    )

    assert_equal(
      cursor.position.column,
      cursor.move('s').column
    )
    assert_equal(
      cursor.position.row + 3,
      cursor.move('down', 3).row
    )
  end

  def test_move_right
    cursor = Cursor.new(Position.new(5, 5))
    assert_equal(
      cursor.position.row,
      cursor.move('d').row
    )
    assert_equal(
      cursor.position.column + 1,
      cursor.move('d').column
    )
    assert_equal(
      cursor.position.column + 3,
      cursor.move('right', 3).column
    )
  end

  def test_move_left
    cursor = Cursor.new(Position.new(5, 5))
    assert_equal(
      cursor.position.row,
      cursor.move('a').row
    )
    assert_equal(
      cursor.position.column - 1,
      cursor.move('a').column
    )
    assert_equal(
      cursor.position.column - 21,
      cursor.move('left', 21).column
    )
  end
end
