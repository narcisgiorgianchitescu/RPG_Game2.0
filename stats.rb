# Class that encapsulates the stats that a hero or item can have
class Stats
  STATS = {
    attack:  0,
    defence: 0,
    hp:      0,
    coins:   0,
  }.freeze
  attr_accessor :attack
  attr_accessor :defence
  attr_accessor :hp
  attr_accessor :coins

  def initialize(stats = {})
    STATS.keys.each { |key| raise 'Need an integer' unless stats[key].is_a? Integer }
    STATS.keys.each { |key| send "#{key}=", (stats[key] || 0) }
  end

  def change_stats(other, sign)
    STATS.keys.each do |key|
      old_val = send key.to_s
      other_val = eval "other.#{key}"
      new_val = old_val.send(sign, other_val)
      send "#{key}=", new_val
    end
  end
end
