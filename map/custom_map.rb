binpath = File.dirname(__FILE__)
$LOAD_PATH.unshift File.expand_path(File.join(binpath, '..'))
require 'require_file'
require 'map_generator'
require 'hospital'
require 'shop'
require 'vault'
require 'win_room'
require 'consumable'
require 'map'
require 'monster_room'
require 'room'
require 'position'

class CustomMap < MapGenerator
  def create_map
    size_map = 10

    map = Map.new(size_map)

    hospital = Hospital.new(false)
    position = Position.new(0, 2)
    map.add_room(hospital, position)

    monster_room = MonsterRoom.new(false)
    position = Position.new(0, 3)
    map.add_room(monster_room, position)

    room = Room.new(false)
    position = Position.new(0, 4)
    map.add_room(room, position)

    stats = Stats.new
    items = []
    items[0] = Consumable.new(stats, 'Default consumable')
    shop = Shop.new(false, items)
    position = Position.new(0, 5)
    map.add_room(shop, position)

    vault = Vault.new(false, items)
    position = Position.new(0, 6)
    map.add_room(vault, position)

    winroom = WinRoom.new(false)
    position = Position.new(0, 7)
    map.add_room(winroom, position)
    map
  end
end
