binpath = File.dirname(__FILE__)
$LOAD_PATH.unshift File.expand_path(File.join(binpath, '..'))
require 'require_file'
require 'test/unit'
require 'room'
require 'hospital'
require 'shop'
require 'vault'
require 'win_room'
require 'monster_room'
require 'hero'

class TestGameRoom < Test::Unit::TestCase

#-------------------------------------------------------------------
#Room

  def test_room_get_hidden
    assert_equal(true, Room.new.hidden, 'Wrong answer')
  end

  def test_room_set_hidden
    room = Room.new(false, [])
    assert_equal(false, room.hidden, 'Wrong answer')
  end

  def test_room_get_input
    assert_equal([], Room.new.input, 'Wrong answer')
  end

  def test_room_set_input
    room = Room.new(false, [1..9])
    assert_equal([1..9], room.input, 'Wrong answer')
  end

  def test_output_room_action
    room = Room.new
    hero = Hero.new
    device = IOterminal.new
    room.set_device(device)
    assert_output(stdout = room.description) {room.action(hero)}
  end

# #-------------------------------------------------------------------
# #Shop

#   def test_shop_true_for_out_of_items?
#     s = Shop.new(true, [])
#     assert_equal(true, s.out_of_items?, 'Wrong answer')
#   end

#   def test_shop_false_for_out_of_items?
#     s = Shop.new
#     assert_equal(false, s.out_of_items?, 'Wrong answer')
#   end

#   def test_shop_action_rez_out_of_items
#     s = Shop.new(true, [])
#     assert_equal(s.out_of_items, s.action, 'Wrong answer')
#   end

#   def test_shop_action_rez_room_data
#     s = Shop.new
#     assert_equal([s.description, s.input], s.action, 'Wrong answer')
#   end

# #-------------------------------------------------------------------
# #Vault

#   def test_vault_action_rez_room_data
#     v = Vault.new
#     assert_equal([v.description, v.input], v.action, 'Wrong answer')
#   end

#   def test_vault_action_rez_already_chose
#     v = Vault.new
#     v.action
#     assert_equal(v.already_chose, v.action, 'Wrong answer')
#   end

# #-------------------------------------------------------------------
# #Hospital

#   def test_hospital_get_input
#     h = Hospital.new
#     assert_equal([[5, 5], [10, 9], [20, 17]], h.input, 'Wrong answer')
#   end

#   def test_hospital_set_input
#     h = Hospital.new(false, [1..9])
#     assert_equal([1..9], h.input, 'Wrong answer')
#   end

#   def test_hospital_action_rez_room_data
#     h = Hospital.new
#     assert_equal([h.description, h.input], h.action, 'Wrong answer')
#   end

# #-------------------------------------------------------------------
# #MonsterRoom

#   def test_monsterroom_action_rez_room_data
#     m = MonsterRoom.new
#     assert_equal([m.description, m.input], m.action, 'Wrong answer')
#   end

# #-------------------------------------------------------------------
# #WinRoom

#   def test_winroom_action_rez_room_data
#     w = WinRoom.new
#     assert_equal(w.you_win, w.action, 'Wrong answer')
#   end

# #-------------------------------------------------------------------
end
