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

class CustomMap < MapGenerator
  def create_map
    size_map = 10

    map = Map.new(size_map)

    hospital = Hospital.new(false)
    map.add_room(hospital, 0, 2)

    monster_room = MonsterRoom.new(false)
    map.add_room(monster_room, 0, 3)

    room = Room.new(false)
    map.add_room(room, 0, 4)

    stats = Stats.new
    items = []
    items[0] = Consumable.new(stats, 'Default consumable')
    shop = Shop.new(false, items)
    map.add_room(shop, 0, 5)

    vault = Vault.new(false, items)
    map.add_room(vault, 0, 6)

    winroom = WinRoom.new(false)
    map.add_room(winroom, 0, 7)
  end
end

CustomMap.new.create_map
