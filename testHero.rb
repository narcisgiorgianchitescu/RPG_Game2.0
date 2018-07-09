require_relative 'character'
require_relative 'stats'
require_relative 'Consumable'
require_relative 'hero'
require_relative 'Weapon'

require 'test/unit'


class TestHero < Test::Unit::TestCase
  def test_use_consumable
    h = Hero.new
    cons = Consumable.new
    cons.stats.hp = 10
    h.use_consumable(cons)
    assert_equal(h.stats.hp, 10)
  end

  def test_change_wearable_head
    h = Hero.new
    w = Wearable.new
    w.type = 'head'
    w.stats.attack = 1
    h.change_wearable(w)
    assert_equal(h.equipment.head, w)
  end

  def test_change_wearable_chest
    h = Hero.new
    w = Wearable.new
    w.type = 'chest'
    w.stats.attack = 2
    h.change_wearable(w)
    assert_equal(h.equipment.chest, w)
  end

  def test_change_wearable_boots
    h = Hero.new
    w = Wearable.new
    w.type = 'boots'
    w.stats.attack = 3
    h.change_wearable(w)
    assert_equal(h.equipment.boots, w)
  end

  def test_change_weapon
    h = Hero.new
    w = Weapon.new
    w.stats.attack = 7
    h.change_weapon(w)
    assert_equal(h.equipment.weapon, w)
  end

  def test_change_weapon_1
      h = Hero.new
      h.stats.attack = 4
      w = Weapon.new
      w.stats.attack = 7
      h.change_weapon(w)
      assert_equal(h.stats.attack, 11)
  end

  def test_change_wearable_boots_1
    h = Hero.new
    h.stats.defence = 2
    w = Wearable.new
    w.type = 'boots'
    w.stats.defence = 3
    h.change_wearable(w)
    assert_equal(h.stats.defence, 5)
  end
end
