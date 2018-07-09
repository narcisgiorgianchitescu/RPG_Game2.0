require_relative 'stats'
# Comment
class Character
  attr_accessor :name, :stats
  def initialize(stats = nil, name = 'noname')
    stats = build_default_stats if stats.nil?
    validate_stats(stats)
    @stats = stats
    @name = name
 end

  def validate_stats(stats)
    raise if stats.attack.negative?
    raise if stats.defence.negative?
    raise if stats.hp.negative?
    raise if stats.coins.negative?
  end

  def build_default_stats
    h = {  attack:  0,
           defence:  0,
           coins:  0,
           hp:  100 }
    stats = Stats.new(h)
    stats
  end
end
