require_relative 'stats'

class Item
  attr_accessor :stats, :name
  def initialize(stats, name = 'Item')
    @stats = stats
    @name = name
  end
end
