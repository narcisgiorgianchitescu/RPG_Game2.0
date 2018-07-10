binpath = File.dirname(__FILE__)
$LOAD_PATH.unshift File.expand_path(File.join(binpath, '..'))
require 'require_file'
require 'minitest/autorun'
require 'map'

# test for Map class
class TestMap < Minitest::Test
  def test_create_custom_size
    map = Map.new(5)
    assert_equal 5, map.size
  end

  def test_valid_position_true
    map = Map.new(5)
    assert_equal map.valid_position?(2, 3), true
  end

  def test_valid_position_false
    map = Map.new(5)
    assert_equal map.valid_position?(6, 3), false
  end

  def test_add_room
    map = Map.new(10)
    room = Room.new
    map.add_room(room, 5, 5)
    assert_equal map.room(5, 5), room
  end

  def test_add_bad_room
    map = Map.new(10)
    invalid_room = 2
    assert_raises(RuntimeError) { map.add_room(invalid_room, 3, 5) }
  end

  def test_clear_room
    map = Map.new(10)
    room = Room.new
    map.add_room(room, 5, 5)
    map.clear_room(5, 5)
    refute_equal room, map.room(5, 5)
  end
end
