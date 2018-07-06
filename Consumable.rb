require_relative 'Item'

class Consumable < Item
  def initialize(stats:, name: 'Consumable')
    super(stats, name)
  end
end
