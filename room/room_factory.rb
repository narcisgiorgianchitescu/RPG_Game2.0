binpath = File.dirname(__FILE__)
$LOAD_PATH.unshift File.expand_path(File.join(binpath, '..'))
require 'require_file'

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
