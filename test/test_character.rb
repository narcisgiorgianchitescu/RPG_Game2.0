binpath = File.dirname(__FILE__)
$LOAD_PATH.unshift File.expand_path(File.join(binpath, '..'))
require 'require_file'
require 'test/unit'
require 'character'
require 'stats'


class TestCharacter < Test::Unit::TestCase
  attr_accessor :stats

  def test_hp
    ch = Character.new
    x = ch.stats
    assert_equal(x.hp, 0)
  end

  def test_attack
    ch = Character.new
    x = ch.stats
    assert_equal(x.attack, 0)
  end

  def test_defence
    ch = Character.new
    x = ch.stats
    assert_equal(x.defence, 0)
  end

  def test_coins
    ch = Character.new
    x = ch.stats
    assert_equal(x.coins, 0)
  end

  def test_name
    ch = Character.new
    assert_equal(ch.name, 'noname')
  end

  def test_alive?
    ch = Character.new
    assert_equal(ch.alive?, false)
  end

  def test_alive_true
    ch = Character.new
    ch.stats.hp = 1
    assert_equal(ch.alive?, true)
  end

  def test_money_false
    ch = Character.new
    assert_equal(ch.has_enough_money?(1), false)
  end

  def test_money_true
    ch = Character.new
    ch.stats.coins = 4
    assert_equal(ch.has_enough_money?(4), true)
  end
end
