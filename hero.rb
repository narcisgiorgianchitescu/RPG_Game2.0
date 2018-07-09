require_relative 'character.rb'

# Hero Modified
class Hero < Character
  def initialize(stats = nil, eq = {}, name = 'noname')
    super(stats, name)
  end


  def use_item(item)
    case item.class.to_s
    when 'Consumable'
      @attack += item.attack
      @defence += item.defence
      @hp += item.hp
    when 'Head'
      equip @head, item
      @head = item
    when 'Chest'
      equip @chest, item
      @chest = item
    when 'Weapon'
      equip @weapon, item
      @weapon = item
    when 'Boots'
      equip @boots, item
      @boots = item
    end
  end

  def equip(old_item, new_item)
    @attack -= (old_item.attack - new_item.attack)
    @defence -= (old_item.defence - new_item.defence)
  end
end
