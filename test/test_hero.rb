binpath = File.dirname(__FILE__)
$LOAD_PATH.unshift File.expand_path(File.join(binpath, '..'))
require 'require_file'
require 'test/unit'
require 'hero'
require 'character'
require 'stats'
require 'weapon'
require 'consumable'

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

  def test_change_wearable_head_effect
    h = Hero.new
    w = Wearable.new
    w.type = 'head'
    w.stats.attack = 1
    h.change_wearable(w)
    assert_equal(h.stats.attack, 1)
  end

  def test_change_wearable_chest
    h = Hero.new
    w = Wearable.new
    w.type = 'chest'
    w.stats.defence = 2
    h.change_wearable(w)
    assert_equal(h.equipment.chest, w)
  end

  def test_change_wearable_chest_effect
    h = Hero.new
    w = Wearable.new
    w.type = 'chest'
    w.stats.defence = 2
    h.change_wearable(w)
    assert_equal(h.stats.defence, 2)
  end

  def test_change_wearable_boots
    h = Hero.new
    w = Wearable.new
    w.type = 'boots'
    w.stats.attack = 3
    h.change_wearable(w)
    assert_equal(h.equipment.boots, w)
  end

  def test_change_wearable_boots_effect
    h = Hero.new
    w = Wearable.new
    w.type = 'boots'
    w.stats.attack = 3
    h.change_wearable(w)
    assert_equal(h.stats.attack, 3)
  end

  def test_change_weapon
    h = Hero.new
    w = Weapon.new
    w.stats.attack = 7
    h.change_weapon(w)
    assert_equal(h.equipment.weapon, w)
  end

  def test_change_weapon_effect
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

  def test_use_item_boots
    h = Hero.new
    h.stats.defence = 2
    w = Wearable.new
    w.type = 'boots'
    w.stats.defence = 3
    h.use_item(w)
    assert_equal(h.stats.defence, 5)
  end

  def test_use_item_chest
    h = Hero.new
    h.stats.defence = 2
    w = Wearable.new
    w.type = 'chest'
    w.stats.defence = 3
    h.use_item(w)
    assert_equal(h.equipment.chest, w)
  end

  def test_use_item_head
    h = Hero.new
    h.stats.defence = 2
    w = Wearable.new
    w.type = 'head'
    w.stats.defence = 3
    h.use_item(w)
    assert_equal(h.equipment.head, w)
  end

  def test_change_weapon_use_item
      h = Hero.new
      h.stats.attack = 4
      w = Weapon.new
      w.stats.attack = 7
      h.use_item(w)
      assert_equal(h.stats.attack, 11)
  end

  def test_use_item_consumable_effect
    h = Hero.new
    cons = Consumable.new
    cons.stats.hp = 10
    h.use_item(cons)
    assert_equal(h.stats.hp, 10)
  end

  def test_initialize_stats
    stats = Stats.new
    stats.hp = 100
    h = Hero.new(stats, "Narcis")
    assert_equal(h.stats, stats)
  end

  def test_initialize_name
    stats = Stats.new
    stats.hp = 100
    h = Hero.new(stats, nil , "Narcis")
    assert_equal(h.name, "Narcis")
  end

  def test_initialize_equipment
    equipment = Equipment.new
    h = Hero.new(nil, equipment)
    assert_equal(h.equipment, equipment)
  end
end
