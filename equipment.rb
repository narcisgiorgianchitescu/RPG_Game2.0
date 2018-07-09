require_relative 'wearable'
require_relative 'Weapon'

class Equipment
  def initialize(head = Wearable.new(Stats.new, :head),
                 chest = Wearable.new(Stats.new, :chest),
                 boots = Wearable.new(Stats.new, :boots),
                 weapon = Weapon.new(Stats.new))
    @head = head
    @chest = chest
    @boots = boots
    @weapon = weapon
  end
end
