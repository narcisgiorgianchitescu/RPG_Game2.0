binpath = File.dirname(__FILE__)
$LOAD_PATH.unshift File.expand_path(File.join(binpath, '..'))
require 'require_file'
require 'minitest/autorun'

class TestStats < Minitest::Test
  def test_initialization_with_hash
    stats = Stats.new(attack: 5, defence: 7, hp: 9, coins: 11)
    assert_equal [5, 7, 9, 11],
                 [stats.attack, stats.defence, stats.hp, stats.coins]
  end

  def test_change_stats_add
    stats = Stats.new(attack: 1, defence: 1, hp: 1, coins: 1)
    stats2 = Stats.new(attack: 2, defence: 4, hp: 6, coins: 8)
    stats.change_stats(stats2, :+)
    assert_equal [3, 5, 7, 9],
                 [stats.attack, stats.defence, stats.hp, stats.coins]
  end

  def test_change_stats_substract
    stats = Stats.new(attack: 1, defence: 1, hp: 1, coins: 1)
    stats2 = Stats.new(attack: 2, defence: 4, hp: 6, coins: 8)
    stats.change_stats(stats2, :-)
    assert_equal [-1, -3, -5, -7],
                 [stats.attack, stats.defence, stats.hp, stats.coins]
  end

  def test_invalid_input
    assert_raises(RuntimeError) { Stats.new(attack: -1) }
  end
end
