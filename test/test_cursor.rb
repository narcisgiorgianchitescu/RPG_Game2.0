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
    assert_equal([4, 5], Cursor.new(Position.new(5, 5)).next('w'))
    assert_equal([3, 5], Cursor.new(Position.new(5, 5)).next('up', 2))
  end

  def test_next_down
    assert_equal([6, 5], Cursor.new(Position.new(5, 5)).next('s'))
    assert_equal([8, 5], Cursor.new(Position.new(5, 5)).next('down', 3))
  end

  def test_next_right
    assert_equal([5, 6], Cursor.new(Position.new(5, 5)).next('d'))
    assert_equal([5, 9], Cursor.new(Position.new(5, 5)).next('right', 4))
  end

  def test_next_left
    assert_equal([5, 4], Cursor.new(Position.new(5, 5)).next('a'))
    assert_equal([5, 0], Cursor.new(Position.new(5, 5)).next('left', 5))
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
