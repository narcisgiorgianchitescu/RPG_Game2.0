require_relative 'character'
require_relative 'stats'
require 'test/unit'


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
end
