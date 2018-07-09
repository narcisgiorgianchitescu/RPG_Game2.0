require_relative 'stats'

class Item
  def initialize(stats, name = 'Item')
    @stats = stats
    @name = name
  end
end
