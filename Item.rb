require_relative 'Stats'

class Item
  def initialize(stats, name = 'Item')
    @stats = stats
    @name = name
  end
end
