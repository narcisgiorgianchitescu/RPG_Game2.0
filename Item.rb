require_relative 'stats'

class Item
  attr_accessor :stats, :name
  def initialize(stats = nil, name = 'Item')
    stats ||= Stats.new
    @stats = stats
    @name = name
  end
end
