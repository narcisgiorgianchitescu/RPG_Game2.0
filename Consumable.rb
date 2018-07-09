require_relative 'Item'

class Consumable < Item
  attr_accessor :stats, :name
  def initialize(stats = nil, name = 'Consumable')
    super(stats, name)
  end
end
