binpath = File.dirname(__FILE__)
$LOAD_PATH.unshift File.expand_path(File.join(binpath, '..'))
require 'require_file'
require 'minitest/autorun'
require 'map'
require 'test/unit'
require 'position'
require 'test_helper'

# test for Map class
class TestMap  < Test::Unit::TestCase
  def test_create_custom_size
    map = Map.new(5)
    assert_equal 5, map.size
  end

  def test_valid_position_true
    map = Map.new(5)
    position = Position.new(2, 3)
    assert_equal map.valid_position?(position), true
  end

  def test_valid_position_false
    map = Map.new(5)
    position = Position.new(6, 3)
    assert_equal map.valid_position?(position), false
  end

  def test_valid_position_true_limits_1
    map = Map.new(5)
    position = Position.new(0, 0)
    assert_equal map.valid_position?(position), true
  end

  def test_valid_position_true_limits_2
    map = Map.new(5)
    position = Position.new(4, 4)
    assert_equal map.valid_position?(position), true
  end

  def test_valid_position_true_limits_3
    map = Map.new(5)
    position = Position.new(0, 4)
    assert_equal map.valid_position?(position), true
  end

  def test_valid_position_true_limits_4
    map = Map.new(5)
    position = Position.new(4, 0)
    assert_equal map.valid_position?(position), true
  end

  def test_valid_position_false_limits_1
    map = Map.new(5)
    position = Position.new(0, -1)
    assert_equal map.valid_position?(position), false
  end

  def test_valid_position_false_limits_2
    map = Map.new(5)
    position = Position.new(4, 5)
    assert_equal map.valid_position?(position), false
  end

  def test_valid_position_false_limits_3
    map = Map.new(5)
    position = Position.new(0, 5)
    assert_equal map.valid_position?(position), false
  end

  def test_valid_position_false_limits_4
    map = Map.new(5)
    position = Position.new(5, 4)
    assert_equal map.valid_position?(position), false
  end

  def test_add_room
    map = Map.new(10)
    room = Room.new
    position = Position.new(5, 5)
    map.add_room(room, position)
    assert_equal map.room(position), room
  end

  def test_add_bad_room
    map = Map.new(10)
    invalid_room = 2
    position = Position.new(3, 5)
    assert_raises(RuntimeError) { map.add_room(invalid_room, position) }
  end

  def test_clear_room
    map = Map.new(10)
    room = Room.new
    position = Position.new(5, 5)
    map.add_room(room, position)
    map.clear_room(position)
    refute_equal room, map.room(position)
  end
end
