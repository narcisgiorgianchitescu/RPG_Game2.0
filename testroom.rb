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
    r.hidden = false
    assert_equal(false, r.hidden, 'Wrong answer')
  end

  def test_room_get_input
    assert_equal([], Room.new.input, 'Wrong answer')
  end

  def test_room_set_input
    r = Room.new
    r.input = ([1..9])
    assert_equal([1..9], r.input, 'Wrong answer')
  end

#-------------------------------------------------------------------

  def test_hospital_get_hidden
    assert_equal(true, Hospital.new.hidden, 'Wrong answer')
  end

  def test_hospital_set_hidden
    h = Hospital.new
    h.hidden = false
    assert_equal(false, h.hidden, 'Wrong answer')
  end

  def test_hospital_get_input
    assert_equal([], Hospital.new.input, 'Wrong answer')
  end

  def test_hospital_set_input
    h = Hospital.new
    h.input = ([1..9])
    assert_equal([1..9], h.input, 'Wrong answer')
  end

#-------------------------------------------------------------------

  def test_shop_get_hidden
    assert_equal(true, Shop.new.hidden, 'Wrong answer')
  end

  def test_shop_set_hidden
    s = Shop.new
    s.hidden = false
    assert_equal(false, s.hidden, 'Wrong answer')
  end

  def test_shop_get_input
    assert_equal([], Shop.new.input, 'Wrong answer')
  end

  def test_shop_set_input
    s = Shop.new
    s.input = ([1..9])
    assert_equal([1..9], s.input, 'Wrong answer')
  end

#-------------------------------------------------------------------

  def test_vault_get_hidden
    assert_equal(true, Vault.new.hidden, 'Wrong answer')
  end

  def test_vault_set_hidden
    v = Vault.new
    v.hidden = false
    assert_equal(false, v.hidden, 'Wrong answer')
  end

  def test_vault_get_input
    assert_equal([], Vault.new.input, 'Wrong answer')
  end

  def test_vault_set_input
    v = Vault.new
    v.input = ([1..9])
    assert_equal([1..9], v.input, 'Wrong answer')
  end

#-------------------------------------------------------------------

  def test_monsterroom_get_hidden
    assert_equal(true, MonsterRoom.new.hidden, 'Wrong answer')
  end

  def test_monsterroom_set_hidden
    m = MonsterRoom.new
    m.hidden = false
    assert_equal(false, m.hidden, 'Wrong answer')
  end

  def test_monsterroom_get_input
    assert_equal([], MonsterRoom.new.input, 'Wrong answer')
  end

  def test_monsterroom_set_input
    m = MonsterRoom.new
    m.input = ([1..9])
    assert_equal([1..9], m.input, 'Wrong answer')
  end

#-------------------------------------------------------------------

  def test_winroom_get_hidden
    assert_equal(true, WinRoom.new.hidden, 'Wrong answer')
  end

  def test_winroom_set_hidden
    w = WinRoom.new
    w.hidden = false
    assert_equal(false, w.hidden, 'Wrong answer')
  end

  def test_winroom_get_input
    assert_equal([], WinRoom.new.input, 'Wrong answer')
  end

  def test_winroom_set_input
    w = WinRoom.new
    w.input = ([1..9])
    assert_equal([1..9], w.input, 'Wrong answer')
  end

#-------------------------------------------------------------------
end