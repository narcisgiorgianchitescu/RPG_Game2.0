binpath = File.dirname(__FILE__)
$LOAD_PATH.unshift File.expand_path(File.join(binpath, '..'))
require 'require_file'
require 'hero'
require 'monster'
require 'io_interface'
require 'combat'
require 'test_helper'

class TestCombat < Minitest::Test
  def setup
    def rand
      1
    end

    def rand n
      1
    end
  end

  def test_monster_dies
    hero = Hero.new(Stats.new(attack: 1, defence: 1, hp: 1))
    monster = Monster.new(Stats.new(attack: 0, defence: 0, hp: 1))
    device = IOinterface.new
    combat = Combat.new(hero, monster, device)
    def combat.choices
      %w[a a]
    end
    assert_equal combat.fight, false
  end

  def test_hero_dies
    hero = Hero.new(Stats.new(attack: 0, defence: 0, hp: 1))
    monster = Monster.new(Stats.new(attack: 1, defence: 1, hp: 1))
    device = IOinterface.new
    combat = Combat.new(hero, monster, device)
    def combat.choices
      %w[a a]
    end
    assert_equal combat.fight, true
  end

  def test_hero_runs
    hero = Hero.new(Stats.new(attack: 1, defence: 1, hp: 1))
    monster = Monster.new(Stats.new(attack: 1, defence: 1, hp: 1), '', 2)
    device = IOinterface.new
    combat = Combat.new(hero, monster, device)
    def combat.choices
      %w[r d]
    end
    assert_equal combat.fight, false
  end

  def test_hero_runs2
    hero = Hero.new(Stats.new(attack: 1, defence: 1, hp: 1))
    monster = Monster.new(Stats.new(attack: 1, defence: 1, hp: 1), '', 2)
    device = IOinterface.new
    combat = Combat.new(hero, monster, device)
    def combat.choices
      %w[r d]
    end
    assert_equal monster.alive?, true
  end
end
