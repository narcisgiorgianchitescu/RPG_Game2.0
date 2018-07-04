require_relative 'Item'
# Item type Consumable
class Consumable < Item
  attr_accessor :hp

  def initialize(attack = 0, defence = 0, value = 0, name = 'Potion', hp1 = 0)
    super(attack, defence, value, name)
    @hp = hp1
  end

  def show(show_value = 0)
    super(1)
    print ", #{@hp} hp"
    print " - #{@value} coins" if show_value.zero
  end
end
