require_relative 'Item'
# Item type Consumable
class Consumable < Item
  attr_accessor :hp

  def initialize(hash_stats = {}, name = 'Potion')
    super(hash_stats, name)
    @hp = hash_stats[:hp].nil? ? 0 : hash_stats[:hp]
  end

  def show(show_value = true)
    super(false)
    print ", #{@hp} hp"
    print " -> #{@value} coins" if show_value == true
  end
end
