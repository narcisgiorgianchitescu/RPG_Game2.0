require_relative 'Consumable'
require_relative 'Head'
require_relative 'Chest'
require_relative 'Boots'
require_relative 'Weapon'

class RoomFactory
  TYPES = {
    room: Room,
    shop: Shop,
    vault: Vault,
    hospital: Hospital,
    lair: Lair,
    win: Wictory_Room
  }.freeze

  def self.create(type, items)
    (TYPES[type] || Room).new(true, items)
  end
end
