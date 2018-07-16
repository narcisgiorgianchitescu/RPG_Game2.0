require_relative 'Room'
require_relative 'Shop'
require_relative 'Vault'
require_relative 'Hospital'
require_relative 'Lair'
require_relative 'Victory_Room'
require_relative 'RandomsGenerator'

class RoomFactory
  TYPES = {
    room: Room,
    shop: Shop,
    vault: Vault,
    hospital: Hospital,
    lair: Lair,
    win: WinRoom
  }.freeze

  PARAMS = {
    room: true,
    shop: RandomsGenerator.random_shop,
    vault: RandomsGenerator.random_vault,
    hospital: [[5, 5], [10, 9], [20, 16], [50, 35]],
    lair: RandomsGenerator.random_monster,
    win: nil
  }.freeze

  def self.create(type)
    TYPES[type].new(PARAMS[type])
  end

  def self.show(type)
    TYPES[type].show
  end
end
