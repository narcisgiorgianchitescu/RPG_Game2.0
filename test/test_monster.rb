binpath = File.dirname(__FILE__)
$LOAD_PATH.unshift File.expand_path(File.join(binpath, '..'))
require 'require_file'
require 'stats'
require 'test/unit'
require 'monster'

class TestMonster < Test::Unit::TestCase
  def test_escape_chance
    m = Monster.new
    assert_equal(m.escape_chance, 0)
  end

  def test_escape_chance_change
    m = Monster.new
    m.escape_chance = 10
    assert_equal(m.escape_chance, 10)
  end

  def test_hp
    ch = Monster.new
    x = ch.stats
    assert_equal(x.hp, 0)
  end

  def test_attack
    ch = Monster.new
    x = ch.stats
    assert_equal(x.attack, 0)
  end

  def test_defence
    ch = Monster.new
    x = ch.stats
    assert_equal(x.defence, 0)
  end

  def test_coins
    ch = Monster.new
    x = ch.stats
    assert_equal(x.coins, 0)
  end

  def test_name
    ch = Monster.new
    assert_equal(ch.name, 'noname')
  end

  def test_alive_default
    ch = Monster.new
    assert_equal(ch.alive?, false)
  end

  def test_alive_true
    ch = Monster.new
    ch.stats.hp = 1
    assert_equal(ch.alive?, true)
  end
end
