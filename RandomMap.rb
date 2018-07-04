require_relative 'Game'
require_relative 'MapGenerator'
require_relative 'Consumable'
require_relative 'Head'
require_relative 'Chest'
require_relative 'Boots'
require_relative 'Weapon'
# Clasa care getereaza o harta
class RandomMap < MapGenerator
  def get_map(hero)
    get_random_map hero
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

  def get_random_map(hero)
    map = Map.new
    map.size.times do |i|
      map.size.times do |j|
        y = get_random_room(hero)
        pos = [i,j]
        map.add_room(y,pos)
      end
    end
    map = spawn_victory_room(map)
  end

  def get_random_item
    case(rand(1..12).to_i)
      when 1..4
        return Consumable.new(rand(-1..2).to_i,rand(-1..2).to_i,rand(10..30),"Random Potion",rand(-5..20).to_i)
      when 5..6
        return Head.new(rand(0..1).to_i,rand(1..6).to_i,rand(10..30).to_i,"Random Head")
      when 7..8
        return Chest.new(0,rand(1..10).to_i,rand(10..30).to_i,"Random Chest")
      when 9..10
        return Boots.new(rand(0..2).to_i,rand(1..3).to_i,rand(10..30).to_i,"Random Boots")
      when 11..12
        return Weapon.new(rand(0..10).to_i,0,rand(10..30).to_i,"Random Weapon")
    end
  end

  def get_random_monster hero
    return Monster.new(rand(15..40).to_i,"random mob",(hero.hp+rand(-10..10).to_i)/2,(hero.attack+rand(-3..1).to_i)/2,(hero.defence+rand(-3..1).to_i)/2,rand(0..100).to_i )
  end

  def get_random_room hero
    x = rand(1..100).to_i
    case x
      when 1..5 #Hospital
          room_new=Hospital.new
      when 6..29 #Lair
        room_new=Lair.new(get_random_monster(hero))
      when 30..39
        items=[]
        rand(3..5).to_i.times do items.push(get_random_item) end
        room_new=Shop.new(items)
      when 40..49
        items=[]
        rand(3..5).to_i.times do items.push(get_random_item) end
        room_new=Vault.new(items)
      else
        room_new=Room.new
    end
    return room_new
  end
end
