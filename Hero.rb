require_relative 'Character.rb'
require_relative 'Head'
require_relative 'Chest'
require_relative 'Boots'
require_relative 'Weapon'
# Hero
class Hero < Character
  attr_accessor :position

  def initialize(money = 10, my_name = 'noname', hp = 100, attack = 1,
                 defence = 1, head = Head.new, chest = Chest.new,
                 boots = Boots.new, weapon = Weapon.new, position = [0, 0])
    super(money, my_name, hp, attack, defence)
    @head = head
    @chest = chest
    @boots = boots
    @weapon = weapon
    @position = position
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
