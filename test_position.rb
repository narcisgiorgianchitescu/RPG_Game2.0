require 'minitest/autorun'
require_relative 'Position'

class TestPosition < Minitest::Test
  def setup; end

  def test_move_up
    assert_equal [4, 5], Position.new(5, 5).move_up.coordinates
    assert_equal [-1, 0], Position.new(0, 0).move_up.coordinates
    assert_equal [-4, -3], Position.new(-3, -3).move_up.coordinates
  end

  def test_move_down
    assert_equal [6, 5], Position.new(5, 5).move_down.coordinates
    assert_equal [1, 0], Position.new(0, 0).move_down.coordinates
    assert_equal [-2, -3], Position.new(-3, -3).move_down.coordinates
  end

  def test_move_right
    assert_equal [5, 6], Position.new(5, 5).move_right.coordinates
    assert_equal [0, 1], Position.new(0, 0).move_right.coordinates
    assert_equal [-3, -2], Position.new(-3, -3).move_right.coordinates
  end

  def test_move_left
    assert_equal [5, 4], Position.new(5, 5).move_left.coordinates
    assert_equal [0, -1], Position.new(0, 0).move_left.coordinates
    assert_equal [-3, -4], Position.new(-3, -3).move_left.coordinates
  end

  def test_next_up
    assert_equal [8, 9], Position.new(9, 9).next_up
    assert_equal [-1, 0], Position.new(0, 0).next_up
    assert_equal [-4, -3], Position.new(-3, -3).next_up
  end

  def test_next_down
    assert_equal [6, 5], Position.new(5, 5).next_down
    assert_equal [1, 0], Position.new(0, 0).next_down
    assert_equal [-2, -3], Position.new(-3, -3).next_down
  end

  def test_next_right
    assert_equal [5, 6], Position.new(5, 5).next_right
    assert_equal [0, 1], Position.new(0, 0).next_right
    assert_equal [-3, -2], Position.new(-3, -3).next_right
  end

  def test_next_left
    assert_equal [5, 4], Position.new(5, 5).next_left
    assert_equal [0, -1], Position.new(0, 0).next_left
    assert_equal [-3, -4], Position.new(-3, -3).next_left
  end
end
