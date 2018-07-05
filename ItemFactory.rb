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

  def self.create(type, hash, name)
    (TYPES[type] || Item).new(hash, name)
    # example: head_new = ItemFactory.for(:head, hash_stats, 'Nou Head')
  end

  def self.show(type, show_value)
    (TYPES[type] || Item).show(show_value)
  end
end
