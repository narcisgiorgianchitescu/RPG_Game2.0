require_relative 'Game'
require_relative 'MapGenerator'
require_relative 'Consumable'
require_relative 'Head'
require_relative 'Chest'
require_relative 'Boots'
require_relative 'Weapon'
# Generating a random map with different tools
class RandomMap < MapGenerator
  def initialize(difficulty = 1)
    # difficulty - 1-10
    @difficulty = difficulty
  end

  def difficulty_multiplier
    @difficulty * -0.1 + 1.5
  end

  def get_map(hero)
    return_random_map hero
  end

  def return_random_map(hero)
    map = Map.new
    map.size.times do |i|
      map.size.times do |j|
        y = return_random_room(hero)
        position = [i, j]
        map.add_room(y, position)
      end
    end
    map = spawn_victory_room(map)
  end

  def return_random_item
    case rand(1..12)
    when 1..4 then return_random_consumable
    when 5..6 then return_random_head
    when 7..8 then return_random_chest
    when 9..10 then return_random_boots
    when 11..12 then return_random_weapon
    end
  end

  def return_random_consumable
    Consumable.new(return_random_consumable_stats, 'Random Potion')
  end

  def return_random_consumable_stats
    { attack: (rand(-1..2) * difficulty_multiplier).to_i,
      defence: (rand(-1..2) * difficulty_multiplier).to_i,
      value: (rand(10..30) * difficulty_multiplier).to_i,
      hp: (rand(-5..20) * difficulty_multiplier).to_i}
  end

  def return_random_head
    Head.new(return_random_stats_equipment, 'Random Helmet')
  end

  def return_random_chest
    Chest.new(return_random_stats_equipment, 'Random Chestplate')
  end

  def return_random_boots
    Boots.new(return_random_stats_equipment, 'Random Boots')
  end

  def return_random_weapon
    Weapon.new(return_random_stats_equipment,'Random Weapon')
  end

  def return_random_stats_equipment
    { attack: (rand(0..5) * difficulty_multiplier).to_i,
      defence: (rand(0..5) * difficulty_multiplier).to_i,
      value: (rand(10..30) * difficulty_multiplier).to_i }
  end

  def return_random_monster(hero)
    Monster.new(
      (rand(15..40) * difficulty_multiplier).to_i,
      'Random Mob',
      ((hero.hp + rand(-10..10)) / difficulty_multiplier).to_i,
      ((hero.attack + rand(-3..1)) / difficulty_multiplier).to_i,
      ((hero.defence + rand(-3..1)) / difficulty_multiplier).to_i,
      rand(0..100)
    )
  end

  def return_random_room(hero)
    case rand(1..100)
    when 1..5 then Hospital.new
    when 6..29 then Lair.new(return_random_monster(hero))
    when 30..39 then return_random_shop
    when 40..49 then return_random_vault
    else
      Room.new
    end
  end

  def return_random_shop
    items = []
    rand(3..5).to_i.times { items.push(return_random_item) }
    Shop.new(items)
  end

  def return_random_vault
    items = []
    rand(3..5).to_i.times { items.push(return_random_item) }
    Vault.new(items)
  end

  def spawn_victory_room(map)
    ob = Wictory_Room.new
    position_spawn = [
      map.size - 1 - rand(map.size / 4),
      map.size - 1 - rand(map.size / 4)
    ]
    map.add_room(ob, position_spawn)
    map
  end
end
