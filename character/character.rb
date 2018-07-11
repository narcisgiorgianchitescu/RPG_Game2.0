binpath = File.dirname(__FILE__)
$LOAD_PATH.unshift File.expand_path(File.join(binpath, '..'))
require 'require_file'
require 'stats'
# Comment
class Character
  attr_accessor :name, :stats
  def initialize(stats = nil, name = 'noname')
    stats ||= Stats.new
    @stats = stats
    @name = name
  end

  def alive?
    @stats.hp.positive?
  end

  def enough_money?(money)
    @stats.coins >= money
  end

  def description
    "#{@name} has the following stats\n" + @stats.description
  end
end
