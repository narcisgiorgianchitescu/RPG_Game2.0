binpath = File.dirname(__FILE__)
$LOAD_PATH.unshift File.expand_path(File.join(binpath, '..'))
require 'require_file'
require 'room'
require 'hospital'
require 'shop'
require 'vault'
require 'win_room'
require 'monster_room'
require 'hero'
require 'io_terminal'
require 'item'
require 'wearable'

require 'room_factory'

require 'minitest/autorun'
require 'test/unit'

class TestGameRoom < MiniTest::Test
  def setup; end
#-------------------------------------------------------------------
#RoomFactory

  def test_create_room
    r = RoomFactory.create(:room)
    assert_equal(Room, r.class, 'Wrong answer')
  end

  def test_create_shop
    r = RoomFactory.create(:shop)
    assert_equal(Shop, r.class, 'Wrong answer')
  end

  def test_create_vault
    r = RoomFactory.create(:vault)
    assert_equal(Vault, r.class, 'Wrong answer')
  end

  def test_create_hospital
    r = RoomFactory.create(:hospital)
    assert_equal(Hospital, r.class, 'Wrong answer')
  end

  def test_create_monster_room
    r = RoomFactory.create(:monsterroom)
    assert_equal(MonsterRoom, r.class, 'Wrong answer')
  end

  def test_create_room
    r = RoomFactory.create(:winroom)
    assert_equal(WinRoom, r.class, 'Wrong answer')
  end

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

  def test_room_set_device
    room = Room.new
    device = IOterminal.new
    room.set_device(device)
    assert_equal(device, room.device, 'Wrong answer')
  end

  def test_room_items_description_no_parameter
    room = Room.new
    assert_equal([], room.items_description(room.input, true), 'Wrong answer')
  end

  def test_room_items_description_with_parameter_and_value
    room = Room.new(true, [Item.new])
    rez = ["Item 0 attack 0 defence 0 coins"]
    assert_equal(rez, room.items_description(room.input, true), 'Wrong answer')
  end

  def test_room_items_description_with_parameter_and_no_value
    room = Room.new(true, [Item.new])
    rez = ["Item 0 attack 0 defence"]
    assert_equal(rez, room.items_description(room.input, false), 'Wrong answer')
  end

#-------------------------------------------------------------------
#Shop

  def test_shop_true_for_out_of_items?
    s = Shop.new(true, [])
    assert_equal(true, s.out_of_items?, 'Wrong answer')
  end

  def test_shop_false_for_out_of_items?
    s = Shop.new
    assert_equal(false, s.out_of_items?, 'Wrong answer')
  end

  def test_shop_give_item_to_hero
    s = Shop.new(true, [Wearable.new])
    s.input[0].stats.attack = 10
    h = Hero.new
    s.give_item_to_hero(h, 0)
    assert_equal(10, h.equipment.head.stats.attack, 'Wrong answer')
  end

  def test_shop_take_money
    s = Shop.new(true, [Wearable.new])
    s.input[0].stats.coins = 10
    h = Hero.new
    h.stats.coins = 20
    s.take_money(h, 0)
    assert_equal(10, h.stats.coins, 'Wrong answer')
  end

  def test_shop_recalculate_supply
    s = Shop.new(true, [Item.new, Item.new])
    s.recalculate_supply(1)
    assert_equal(1, s.input.size, 'Wrong answer')
  end

#-------------------------------------------------------------------
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
