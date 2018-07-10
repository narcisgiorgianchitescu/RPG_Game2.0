binpath = File.dirname(__FILE__)
$LOAD_PATH.unshift File.expand_path(File.join(binpath, '..'))
require 'require_file'
require 'stats'
# Comment
class Character
  attr_accessor :name, :stats
  def initialize(stats = nil, name = 'noname')
    stats ||= Stats.new
    validate_stats(stats)
    @stats = stats
    @name = name
  end

  def validate_stats(stats)
    #raise if stats.attack.negative?
    #raise if stats.defence.negative?
    #raise if stats.hp.negative?
    #raise if stats.coins.negative?
  end

  def alive?
    @stats.hp.positive?
  end

  def has_enough_money?(money)
    @stats.coins >= money
  end

  def description
    "#{@name} has the following stats\n"\
              "#{@stats.attack} attack\n"\
              "#{@stats.defence} defence\n"\
              "#{@stats.hp} hp\n"\
              "#{@stats.coins} coins\n"
  end
end
