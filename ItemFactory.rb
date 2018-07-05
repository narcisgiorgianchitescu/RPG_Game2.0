require_relative 'Consumable'
require_relative 'Head'
require_relative 'Chest'
require_relative 'Boots'
require_relative 'Weapon'

class ItemFactory
  TYPES = {
    consumable: Consumable,
    head: Head,
    chest: Chest,
    boots: Boots,
    weapon: Weapon,
    equipment: Equipment,
    item: Item
  }.freeze

  def self.create(type, attributes)
    (TYPES[type] || Item).new(attributes)
  end
end
