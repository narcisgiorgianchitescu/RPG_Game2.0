require_relative 'Room'
require_relative 'Shop'
require_relative 'Vault'
require_relative 'Hospital'
require_relative 'Lair'
require_relative 'Victory_Room'

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
    TYPES[type].new(items)
  end

  def self.show(type)
    TYPES[type].show
  end
end
