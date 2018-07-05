require_relative 'Character.rb'
require_relative 'Head'
require_relative 'Chest'
require_relative 'Boots'
require_relative 'Weapon'
# Hero
class Hero < Character
  attr_accessor :position
  attr_accessor :head
  attr_accessor :chest
  attr_accessor :boots
  attr_accessor :weapon

  def initialize(hash_stats = {}, hash_eq = {})
    super(hash_stats)
    @head = hash_eq[:head].nil? ? Head.new : hash_eq[:head]
    @chest = hash_eq[:chest].nil? ? Chest.new : hash_eq[:chest]
    @boots = hash_eq[:boots].nil? ? Boots.new : hash_eq[:boots]
    @weapon = hash_eq[:weapon].nil? ? Weapon.new : hash_eq[:weapon]
    @position = hash_eq[:position].nil? ? [0, 0] : hash_eq[:position]
  end

  def show_stats
    super
    print @head.show, "\n"
    print @chest.show, "\n"
    print @boots.show, "\n"
    print @weapon.show, "\n"
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

  def go_up
    @position[0] -= 1
  end

  def go_down
    @position[0] += 1
  end

  def go_left
    @position[1] -= 1
  end

  def go_right
    @position[1] += 1
  end
end
