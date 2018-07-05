require_relative 'Game'
require_relative 'MapGenerator'

class CustomMap < MapGenerator
  def get_map(hero)
    map = Map.new
    hash_sword = { attack: 10, defence: 5, value: 100 }
    sword = Weapon.new hash_sword, 'Sword'

    hash_boots = { attack: 0, defence: 10, value: 50 }
    boots = Boots.new hash_boots, 'Boots'

    shop = Shop.new [sword, boots]
    map.add_room shop, [1, 2]

    hospital = Hospital.new
    map.add_room hospital, [2, 1]

    vault = Vault.new [boots, sword]
    map.add_room vault, [0, 1]

    lair = Lair.new
    map.add_room lair, [2, 2]

    victory = Wictory_Room.new
    map.add_room victory, [3, 3]
    map
  end
end
