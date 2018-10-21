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

require 'test/unit'

class TestGameRoom < Test::Unit::TestCase
  def setup; end
  #-------------------------------------------------------------------
  # RoomFactory

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

  def test_create_room2
    r = RoomFactory.create(:winroom)
    assert_equal(WinRoom, r.class, 'Wrong answer')
  end

  #-------------------------------------------------------------------
  # Room

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
    i = Item.new
    room = Room.new(true, [i])
    rez = [i.description(true).chomp]
    assert_equal(rez, room.items_description(room.input, true), 'Wrong answer')
  end

  def test_room_items_description_with_parameter_and_no_value
    i = Item.new
    room = Room.new(true, [i])
    rez = [i.description(false).chomp]
    assert_equal(rez, room.items_description(room.input, false), 'Wrong answer')
  end

  #-------------------------------------------------------------------
  # Shop

  def test_shop_true_for_out_of_items?
    s = Shop.new(true, [])
    assert_equal(true, s.out_of_items?, 'Wrong answer')
  end

  def test_shop_false_for_out_of_items?
    s = Shop.new
    assert_equal(false, s.out_of_items?, 'Wrong answer')
  end

  def test_shop_give_item_to_hero
    s = Shop.new(true, [Wearable.new, Wearable.new])
    s.input[0].stats.attack = 10
    s.input[0].stats.coins = 10
    h = Hero.new
    device = IOinterface.new
    def device.input
      '0'
    end
    h.stats.coins = 100
    s.set_device(device)
    s.action(h)
    rez = Hero.new.stats.attack + 10
    assert_equal(rez, h.stats.attack, 'Attack not modified')
  end

  def test_shop_recalculate_supply
    s = Shop.new(true, [Item.new, Item.new])
    s.recalculate_supply(1)
    assert_equal(1, s.input.size, 'Wrong answer')
  end

  #-------------------------------------------------------------------
  # Vault

  def test_vault_give_item
    v = Vault.new(true, [Wearable.new])
    v.input[0].stats.attack = 10
    h = Hero.new
    v.give_item(h, 0)
    assert_equal(10, h.equipment.head.stats.attack, 'Wrong answer')
  end

  def test_vault_hero_chose_item
    v = Vault.new
    v.hero_chose_item
    assert_equal(true, v.got_item, 'Wrong answer')
  end

  def test_vault_output_game_on
    v = Vault.new
    h = Hero.new
    assert_equal(true, v.output(h), 'Wrong answer')
  end

  def test_vault_output_game_over
    v = Vault.new
    h = Hero.new
    h.stats.hp = 0
    assert_equal(true, v.output(h), 'Wrong answer')
  end

  #-------------------------------------------------------------------
  # Hospital

  def test_hospital_heal_hero
    h = Hospital.new(true, [[5, 5]])
    hero = Hero.new
    hero.stats.hp = 10
    h.heal_hero(hero, 0)
    assert_equal(15, hero.stats.hp, 'Wrong answer')
  end

  def test_hospital_take_money_from_hero
    h = Hospital.new(true, [[5, 5]])
    hero = Hero.new
    hero.stats.coins = 10
    h.take_money_from_hero(hero, 0)
    assert_equal(5, hero.stats.coins, 'Wrong answer')
  end

  #-------------------------------------------------------------------
  # WinRoom

  def test_winroom_action_rez_room_data
    w = WinRoom.new
    h = Hero.new
    assert_equal(w.you_win, w.action(h), 'Wrong answer')
  end

  #-------------------------------------------------------------------
end
