def gen_random_map
  @map.size.times do |i|
      @map.size.times do |j|
          @map.add_room(gen_random_room,[i,j])
      end
  end
  return @map
end


def gen_random_item
  case(rand(1..12))
    when 1..4
      return Consumable.new(rand(-1..2),rand(-1..2),"Random Potion",rand(-5,20))
    when 5..6
      return Head.new(rand(0..1),rand(1..6),rand(10..30),"Random Head")
    when 7..8
      return Chest.new(0,rand(1..10),rand(10..30),"Random Chest")
    when 9..10
      return Boots.new(rand(0..2),rand(1..3),rand(10..30),"Random Boots")
    when 11..12
      return Weapon.new(rand(0..10),0,rand(10..30),"Random Weapon")
  end
end

def gen_random_monster
  return Monster.new(rand(1..10),"random mob",@hero.hp+rand(-10..10),@hero.attack+rand(-3..1),@hero.defence+rand(-3..1),rand(0..100) )
end

def gen_random_room
  case rand(1..100)
    when 1..5 #Hospital
        room_new=Hospital.new
    when 6..29 #Lair
      room_new=Lair.new(gen_random_monster)
    when 30..39
      items=[]
      rand(3..5).times items.push(gen_random_item) end
      room_new=Shop.new(items)
    when 30..39
      items=[]
      rand(3..5).times items.push(gen_random_item) end
      room_new=Vault.new(items)
    else
      room_new=Room.new
  end
  return room_new
end
