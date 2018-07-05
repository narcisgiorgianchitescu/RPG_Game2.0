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
    # example: head_new = ItemFactory.create(:head, hash_stats, 'New Head')
  end

  def self.show(type, show_value)
    (TYPES[type] || Item).show(show_value)
  end

  def self.name(type)
    case TYPES[type]
    when Consumable then 'Random Potion'
    when Chest then 'Random Chestplat'
    when Boots then 'Random Boots'
    when Weapon then 'Random Weapon'
    when Equipment then 'Random Equipment'
    else 'Random Item'
    end
  end

end
