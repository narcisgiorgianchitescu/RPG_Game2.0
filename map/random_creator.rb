binpath = File.dirname(__FILE__)
$LOAD_PATH.unshift File.expand_path(File.join(binpath, '..'))
require 'require_file'
require 'consumable'
require 'weapon'
require 'monster_room'
require 'wearable'
require 'shop'
require 'hospital'
require 'vault'
require 'hero'
require 'map'
require 'win_room'
require 'json'
# TODO: Test
module RandomCreator
  def self.difficulty_multiplier(difficulty = 0)
    # difficulty between 0 and 10
    difficulty * -0.1 + 1.5
    # TODO: solution?
  end

  def self.map(hero, difficulty = 0, size = 10)
    map = Map.new(size)
    map.size.times do |i|
      map.size.times do |j|
        y = room(hero, difficulty)
        position = Position.new(i, j)
        map.add_room(y, position)
      end
    end
    map = spawn_victory_room(map)
  end

  def self.room(hero, difficulty = 0)
    case rand(1..100)
    when 1..5 then Hospital.new
    when 6..29 then MonsterRoom.new(true, monster(hero, difficulty))
    when 30..39 then shop(difficulty)
    when 40..49 then vault(difficulty)
    else
      Room.new
    end
  end

  def self.spawn_victory_room(map)
    ob = WinRoom.new
    row = map.size - 1 - rand(map.size / 4)
    column = map.size - 1 - rand(map.size / 4)
    position = Position.new(row, column)
    map.add_room(ob, position)
    map
  end

  def self.item(difficulty = 0)
    case rand(1..12)
    when 1..4 then consumable(difficulty)
    when 5..6 then head(difficulty)
    when 7..8 then chest(difficulty)
    when 9..10 then boots(difficulty)
    when 11..12 then weapon(difficulty)
    end
  end

  def self.consumable(difficulty = 0)
    Consumable.new(consumable_stats(difficulty), consumable_name)
  end

  def self.consumable_stats(difficulty = 0)
    Stats.new(consumable_stats_hash(difficulty))
  end

  def self.consumable_stats_hash(difficulty = 0)
    { attack: (rand(-1..2) * difficulty_multiplier(difficulty)).to_i,
      defence: (rand(-1..2) * difficulty_multiplier(difficulty)).to_i,
      coins: (rand(10..30) * difficulty_multiplier(difficulty)).to_i,
      hp: (rand(-1..5) * difficulty_multiplier(difficulty)).to_i }
  end

  def self.head(difficulty = 0)
    Wearable.new(stats_equipment(difficulty), :head, build_name('utilities/names.json', "head_names"))
  end

  def self.chest(difficulty = 0)
    Wearable.new(stats_equipment(difficulty), :chest, build_name('utilities/names.json', "chest_names"))
  end

  def self.boots(difficulty = 0)
    Wearable.new(stats_equipment(difficulty), :boots, build_name('utilities/names.json', "boots_names"))
  end

  def self.weapon(difficulty = 0)
    Weapon.new(stats_equipment(difficulty), build_name('utilities/names.json', "weapon_names"))
  end

  def self.stats_equipment(difficulty = 0)
    Stats.new(attack: (rand(0..5) * difficulty_multiplier(difficulty)).to_i,
              defence: (rand(0..5) * difficulty_multiplier(difficulty)).to_i,
              coins: (rand(10..30) * difficulty_multiplier(difficulty)).to_i)
  end

  def self.stats_monster(hero, difficulty = 0)
    Stats.new(coins: (rand(15..40) * difficulty_multiplier(difficulty)).to_i,
              hp: ((hero.stats.hp +
                rand(-5..5)).abs / difficulty_multiplier(difficulty)).to_i,
              attack: ((hero.stats.attack +
                rand(-3..1)).abs / difficulty_multiplier(difficulty)).to_i,
              defence: ((hero.stats.defence +
                rand(-3..1)).abs / difficulty_multiplier(difficulty)).to_i)
  end

  def self.monster_name
    json_obj = JSON.parse(File.read('utilities/names.json'))
    other_monsters = %w[Zombie Ghost Mimic Werewolf Savage]
    [json_obj["bear_names"], json_obj["wolf_names"], json_obj["bat_names"], other_monsters].sample.sample
  end

  def self.build_name(json_file, key)
    json_obj = JSON.parse(File.read(json_file))
    data = json_obj[key]
    "#{data["model"].sample} #{data["type"].sample.upcase} of #{data["aspect"].sample}"
  end

  def self.consumable_name
    self.build_name('utilities/names.json', "consumable_names")
  end

  def self.monster(hero, difficulty = 0)
    case rand(1..100)
    when 1..90 then Monster.new(stats_monster(hero, difficulty), monster_name, rand(0..100))
    when 91..95 then Monster.new(stats_monster(hero, 7), 'Samson', rand(0..100))
    when 96..98 then Monster.new(stats_monster(hero, 9), 'Monkey King', rand(0..100))
    when 99 then Monster.new(stats_monster(hero, 10), 'Mojojojo', rand(0..100))
    when 100 then Monster.new(stats_monster(hero, 12), 'Politehnica', rand(0..100))
    end
  end

  def self.shop(difficulty = 0)
    items = []
    rand(3..5).times { items.push(item(difficulty)) }
    Shop.new(true, items)
  end

  def self.vault(difficulty = 0)
    items = []
    rand(3..5).to_i.times { items.push(item(difficulty)) }
    Vault.new(true, items)
  end

  # private :spawn_victory_room, :consumable_stats, :consumable_stats_hash
  # private :stats_monster, :stats_equipment, :monster_name
end
