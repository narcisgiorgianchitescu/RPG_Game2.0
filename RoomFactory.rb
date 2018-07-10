require_relative 'Room'
require_relative 'Shop'
require_relative 'Vault'
require_relative 'Hospital'
require_relative 'monster_room'
require_relative 'WinRoom'

class RoomFactory
  TYPES = {
    room: Room,
    shop: Shop,
    vault: Vault,
    hospital: Hospital,
    monsterrom: MonsterRoom,
    win: WinRoom
  }.freeze

  def self.create(type, *arg)
    TYPES[type].new(arg)
  end

  def self.describe(type)
    TYPES[type].get_room_description
  end
end

# r = RoomFactory.create(:vault, true, [1, 2, 3, [4, 5]])
# puts r.description
# puts r.hidden
# puts r.input