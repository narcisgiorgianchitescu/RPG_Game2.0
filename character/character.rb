require_relative 'stats'
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
end
