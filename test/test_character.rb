binpath = File.dirname(__FILE__)
$LOAD_PATH.unshift File.expand_path(File.join(binpath, '..'))
require 'require_file'
require 'test/unit'
require 'character'


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

  def test_hp
    ch = Character.new
  end
end
