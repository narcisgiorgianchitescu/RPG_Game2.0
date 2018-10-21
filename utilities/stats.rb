# Class that encapsulates the stats that a hero or item can have
class Stats
  STATS = {
    attack:  10,
    defence: 10,
    hp:      100,
    coins:   100
  }.freeze
  attr_accessor :attack
  attr_accessor :defence
  attr_accessor :hp
  attr_accessor :coins

  def initialize(stats = {})
    STATS.keys.each do |key|
      raise 'Need an integer' unless (stats[key].is_a? Integer) ||
                                     stats[key].nil?
    end
    STATS.keys.each { |key| send "#{key}=", (stats[key] || 0) }
  end

  def change_stats(_other, sign)
    STATS.keys.each do |key|
      old_val = send key.to_s
      other_val = eval "other.#{key}"
      new_val = old_val.send(sign, other_val)
      send "#{key}=", new_val
    end
  end

  def description
    "#{attack} attack\n"\
    "#{defence} defence\n"\
    "#{hp} hp\n"\
    "#{coins} coins\n"
  end
end
