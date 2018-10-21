binpath = File.dirname(__FILE__)
$LOAD_PATH.unshift File.expand_path(File.join(binpath, '..'))
require 'require_file'
require 'character'
require 'stats'
require 'test_helper'


class TestCharacter < Minitest::Test
  def setup
    @ch = Character.new
  end

  def test_alive?
    @ch.stats.hp = 0
    assert_equal(@ch.alive?, false)
    @ch.stats.hp = -1
    assert_equal(@ch.alive?, false)
  end

  def test_alive_true
    @ch.stats.hp = 1
    assert_equal(@ch.alive?, true)
  end

  def test_money_false
    @ch.stats.coins = 0
    assert_equal(@ch.enough_money?(1), false)
    @ch.stats.coins = -2
    assert_equal(@ch.enough_money?(1), false)
  end

  def test_money_true
    @ch.stats.coins = 4
    assert_equal(@ch.enough_money?(4), true)
    @ch.stats.coins = 101
    assert_equal(@ch.enough_money?(2), true)
  end
end
