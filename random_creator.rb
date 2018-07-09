require_relative 'Consumable'
require_relative 'Weapon'
require_relative 'MonsterRoom'
require_relative 'wearable'
require_relative 'Shop'
require_relative 'Hospital'
require_relative 'Vault'
require_relative 'hero'
require_relative 'map'
require_relative 'WinRoom'

module RandomCreator
  def self.difficulty_multiplier(difficulty = 0)
    difficulty * -0.1 + 1.5
    # TODO solution?
  end

  def self.random_map(hero, difficulty = 0)
    map = Map.new
    map.size.times do |i|
      map.size.times do |j|
        y = random_room(hero, difficulty)
        map.add_room(y, i, j)
      end
    end
    map = spawn_victory_room(map)
  end

  def self.random_room(hero, difficulty = 0)
    case rand(1..100)
    when 1..5 then Hospital.new
    #when 6..29 then MonsterRoom.new(true, random_monster(hero, difficulty))
    when 30..39 then random_shop(difficulty)
    when 40..49 then random_vault(difficulty)
    else
      Room.new
    end
  end

  def self.spawn_victory_room(map)
    ob = WinRoom.new
    row = map.size - 1 - rand(map.size / 4)
    column = map.size - 1 - rand(map.size / 4)
    map.add_room(ob, row, column)
    map
  end

  def self.random_item(difficulty = 0)
    case rand(1..12)
    when 1..4 then random_consumable(difficulty)
    when 5..6 then random_head(difficulty)
    when 7..8 then random_chest(difficulty)
    when 9..10 then random_boots(difficulty)
    when 11..12 then random_weapon(difficulty)
    end
  end
  def self.random_consumable(difficulty)
    Consumable.new(random_consumable_stats, 'Random Consumable')
  end
  def self.random_consumable_stats(difficulty = 0)
    Stats.new(random_consumable_stats_hash(difficulty))
  end

  def self.random_consumable_stats_hash(difficulty = 0)
    { attack: (rand(-1..2) * difficulty_multiplier(difficulty)).to_i,
      defence: (rand(-1..2) * difficulty_multiplier(difficulty)).to_i,
      value: (rand(10..30) * difficulty_multiplier(difficulty)).to_i,
      hp: (rand(-5..20) * difficulty_multiplier(difficulty)).to_i}
  end

  def self.random_head(difficulty = 0)
    Wearable.new(random_stats_equipment(difficulty), :head, 'Random Head')
  end

  def self.random_chest(difficulty = 0)
    Wearable.new(random_stats_equipment(difficulty), :chest, 'Random Chest')
  end

  def self.random_boots(difficulty = 0)
    Wearable.new(random_stats_equipment(difficulty), :boots, 'Random Boots')
  end

  def self.random_weapon(difficulty = 0)
    Weapon.new(random_stats_equipment(difficulty), 'Random Weapon')
  end

  def self.random_stats_equipment(difficulty = 0)
    Stats.new({ attack: (rand(0..5) * difficulty_multiplier(difficulty)).to_i,
      defence: (rand(0..5) * difficulty_multiplier(difficulty)).to_i,
      value: (rand(10..30) * difficulty_multiplier(difficulty)).to_i })
  end

=begin
  def self.random_stats_monster(hero, difficulty = 0)
    { money: (rand(15..40) * difficulty_multiplier(difficulty)).to_i,
      name: random_monster_name,
      hp: ((hero.hp + rand(-10..10)) / difficulty_multiplier(difficulty)).to_i,
      attack: ((hero.attack + rand(-3..1)) / difficulty_multiplier(difficulty)).to_i,
      defence: ((hero.defence + rand(-3..1)) / difficulty_multiplier(difficulty)).to_i,
    }
  end
=end

=begin
  def self.random_monster_name
    bear_names = ['Angry Bear', 'Mad Bear', 'Stone Bear', 'Grizzly Bear']
    wolf_names = ['Rabid Wold', 'Big Wolf', 'Mad Wolf', 'White Wolf']
    bat_names  = ['Bloodsucking Bat', 'Giant Bat', 'Mutated Bat']
    other_monsters = ['Zombie', 'Ghost', 'Mimic', 'Werewolf', 'Savage']
    [bear_names, wolf_names, bat_names, other_monsters].sample.sample
  end
=end

=begin
  def self.random_monster(hero, difficulty = 0)
    Monster.new(random_stats_monster(hero, difficulty), rand(0..100))
  end
=end

  def self.random_shop(difficulty = 0)
    items = []
    rand(3..5).times { items.push(random_item(difficulty)) }
    Shop.new(true, items)
  end

  def self.random_vault(difficulty = 0)
    items = []
    rand(3..5).to_i.times { items.push(random_item(difficulty)) }
    Vault.new(true, items)
  end
end
