binpath = File.dirname(__FILE__)
$LOAD_PATH.unshift File.expand_path(File.join(binpath, '..'))
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
    assert_equal(
      Cursor.new(Position.new(4, 5)).position,
      Cursor.new(Position.new(5, 5)).move('w')
    )

    assert_equal(
      Cursor.new(Position.new(3, 5)).position,
      Cursor.new(Position.new(5, 5)).move('up', 2)
    )
  end

  def test_move_down
    assert_equal(
      Cursor.new(Position.new(6, 5)).position,
      Cursor.new(Position.new(5, 5)).move('s')
    )

    assert_equal(
      Cursor.new(Position.new(8, 5)).position,
      Cursor.new(Position.new(5, 5)).move('down', 3)
    )
  end

  def test_move_right
    assert_equal(
      Cursor.new(Position.new(5, 6)).position,
      Cursor.new(Position.new(5, 5)).move('d')
    )

    assert_equal(
      Cursor.new(Position.new(5, 9)).position,
      Cursor.new(Position.new(5, 5)).move('right', 4)
    )
  end

  def test_move_left
    assert_equal(
      Cursor.new(Position.new(5, 4)).position,
      Cursor.new(Position.new(5, 5)).move('a')
    )

    assert_equal(
      Cursor.new(Position.new(5, 0)).position,
      Cursor.new(Position.new(5, 5)).move('left', 5)
    )
  end
end
