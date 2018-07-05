require_relative 'Game'
require_relative 'MapGenerator'
require_relative 'Consumable'
require_relative 'Head'
require_relative 'Chest'
require_relative 'Boots'
require_relative 'Weapon'

module RandomsGenerator
  def self.difficulty_multiplier(difficulty)
    difficulty * -0.1 + 1.5
  end

  def self.return_random_map(hero, difficulty)
    map = Map.new
    map.size.times do |i|
      map.size.times do |j|
        y = return_random_room(hero, difficulty)
        position = [i, j]
        map.add_room(y, position)
      end
    end
    map = spawn_victory_room(map)
  end

  def self.return_random_item(difficulty)
    case rand(1..12)
    when 1..4 then return_random_consumable(difficulty)
    when 5..6 then return_random_head(difficulty)
    when 7..8 then return_random_chest(difficulty)
    when 9..10 then return_random_boots(difficulty)
    when 11..12 then return_random_weapon(difficulty)
    end
  end

  def self.return_random_consumable(difficulty)
    Consumable.new(return_random_consumable_stats(difficulty), 'Random Potion')
  end

  def self.return_random_consumable_stats(difficulty)
    { attack: (rand(-1..2) * difficulty_multiplier(difficulty)).to_i,
      defence: (rand(-1..2) * difficulty_multiplier(difficulty)).to_i,
      value: (rand(10..30) * difficulty_multiplier(difficulty)).to_i,
      hp: (rand(-5..20) * difficulty_multiplier(difficulty)).to_i}
  end

  def self.return_random_head(difficulty)
    Head.new(return_random_stats_equipment(difficulty), 'Random Helmet')
  end

  def self.return_random_chest(difficulty)
    Chest.new(return_random_stats_equipment(difficulty), 'Random Chestplate')
  end

  def self.return_random_boots(difficulty)
    Boots.new(return_random_stats_equipment(difficulty), 'Random Boots')
  end

  def self.return_random_weapon(difficulty)
    Weapon.new(return_random_stats_equipment(difficulty),'Random Weapon')
  end

  def self.return_random_stats_equipment(difficulty)
    { attack: (rand(0..5) * difficulty_multiplier(difficulty)).to_i,
      defence: (rand(0..5) * difficulty_multiplier(difficulty)).to_i,
      value: (rand(10..30) * difficulty_multiplier(difficulty)).to_i }
  end

  def self.return_random_stats_monster(hero, difficulty)
    { money: (rand(15..40) * difficulty_multiplier(difficulty)).to_i,
      name: 'Random Mob',
      hp: ((hero.hp + rand(-10..10)) / difficulty_multiplier(difficulty)).to_i,
      attack: ((hero.attack + rand(-3..1)) / difficulty_multiplier(difficulty)).to_i,
      defence: ((hero.defence + rand(-3..1)) / difficulty_multiplier(difficulty)).to_i,
    }
  end

  def self.return_random_monster(hero, difficulty)
    Monster.new(return_random_stats_monster(hero, difficulty), rand(0..100))
  end

  def self.return_random_room(hero, difficulty)
    case rand(1..100)
    when 1..5 then Hospital.new
    when 6..29 then Lair.new(return_random_monster(hero, difficulty))
    when 30..39 then return_random_shop(difficulty)
    when 40..49 then return_random_vault(difficulty)
    else
      Room.new
    end
  end

  def self.return_random_shop(difficulty)
    items = []
    rand(3..5).times { items.push(return_random_item(difficulty)) }
    Shop.new(items)
  end

  def self.return_random_vault(difficulty)
    items = []
    rand(3..5).to_i.times { items.push(return_random_item(difficulty)) }
    Vault.new(items)
  end

  def self.spawn_victory_room(map)
    ob = Wictory_Room.new
    position_spawn = [
      map.size - 1 - rand(map.size / 4),
      map.size - 1 - rand(map.size / 4)
    ]
    map.add_room(ob, position_spawn)
    map
  end
end
