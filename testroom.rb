require_relative 'Room'
require_relative 'Shop'
require_relative 'Hospital'
require_relative 'MonsterRoom'
require_relative 'Vault'
require_relative 'WinRoom'

require "test/unit"

class TestGameRoom < Test::Unit::TestCase
#-------------------------------------------------------------------

  def test_room_get_hidden
    assert_equal(true, Room.new.hidden, 'Wrong answer')
  end

  def test_room_set_hidden
    r = Room.new
    r.set_hidden(true)
    assert_equal(true, r.get_hidden, 'Wrong answer')
  end

  def test_room_get_input
    assert_equal([], Room.new.get_input, 'Wrong answer')
  end

  def test_room_set_input
    r = Room.new
    r.set_input([1..9])
    assert_equal([1..9], r.get_input, 'Wrong answer')
  end

  def test_room_description
    r = Room.new
    assert_equal(r.description, r.get_room_description, 'Wrong answer')
  end

#-------------------------------------------------------------------

  def test_shop_get_hidden
    assert_equal(true, Shop.new.get_hidden, 'Wrong answer')
  end

  def test_shop_set_hidden
    s = Shop.new
    s.set_hidden(true)
    assert_equal(true, s.get_hidden, 'Wrong answer')
  end

  def test_shop_get_input
    assert_equal([], Shop.new.get_input, 'Wrong answer')
  end

  def test_shop_set_input
    s = Shop.new
    s.set_input([1..9])
    assert_equal([1..9], s.get_input, 'Wrong answer')
  end

  def test_shop_description
    s = Shop.new
    assert_equal(s.description, s.get_room_description, 'Wrong answer')
  end

#----------------------------------------------------

  def test_hospital_get_hidden
    assert_equal(true, Shop.new.get_hidden, 'Wrong answer')
  end

  def test_hospital_set_hidden
    h = Shop.new
    h.set_hidden(true)
    assert_equal(true, h.get_hidden, 'Wrong answer')
  end

  def test_hospital_get_input
    assert_equal([], Hospital.new.get_input, 'Wrong answer')
  end

  def test_hospital_set_input
    h = Shop.new
    h.set_input([1..9])
    assert_equal([1..9], h.get_input, 'Wrong answer')
  end

  def test_hospital_description
    h = Hospital.new
    assert_equal(h.description, h.get_room_description, 'Wrong answer')
  end

#----------------------------------------------------

  def test_monsterrom_get_hidden
    assert_equal(true, MonsterRoom.new.get_hidden, 'Wrong answer')
  end

  def test_monsterrom_set_hidden
    mr = MonsterRoom.new
    mr.set_hidden(true)
    assert_equal(true, mr.get_hidden, 'Wrong answer')
  end

  def test_monsterrom_get_input
    assert_equal([], MonsterRoom.new.get_input, 'Wrong answer')
  end

  def test_monsterrom_set_input
    mr = MonsterRoom.new
    mr.set_input([1..9])
    assert_equal([1..9], mr.get_input, 'Wrong answer')
  end

  def test_monsterrom_description
    mr = MonsterRoom.new
    assert_equal(mr.description, mr.get_room_description, 'Wrong answer')
  end

#----------------------------------------------------

  def test_vault_get_hidden
    assert_equal(true, Vault.new.get_hidden, 'Wrong answer')
  end

  def test_vault_set_hidden
    v = Vault.new
    v.set_hidden(true)
    assert_equal(true, v.get_hidden, 'Wrong answer')
  end

  def test_vault_get_input
    assert_equal([], Vault.new.get_input, 'Wrong answer')
  end

  def test_vault_set_input
    v = Vault.new
    v.set_input([1..9])
    assert_equal([1..9], v.get_input, 'Wrong answer')
  end

  def test_vault_description
    v = Vault.new
    assert_equal(v.description, v.get_room_description, 'Wrong answer')
  end

#----------------------------------------------------

  def test_winroom_get_hidden
    assert_equal(true, WinRoom.new.get_hidden, 'Wrong answer')
  end

  def test_winroom_set_hidden
    wr = WinRoom.new
    wr.set_hidden(true)
    assert_equal(true, wr.get_hidden, 'Wrong answer')
  end

  def test_winroom_get_input
    assert_equal([], WinRoom.new.get_input, 'Wrong answer')
  end

  def test_winroom_set_input
    wr = WinRoom.new
    wr.set_input([1..9])
    assert_equal([1..9], wr.get_input, 'Wrong answer')
  end

  def test_winroom_description
    wr = WinRoom.new
    assert_equal(wr.description, wr.get_room_description, 'Wrong answer')
  end

#----------------------------------------------------
end