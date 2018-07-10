binpath = File.dirname(__FILE__)
$LOAD_PATH.unshift File.expand_path(File.join(binpath, '..'))
require 'require_file'
require 'character.rb'
require 'equipment'
require 'consumable'
require 'wearable'
# Hero Modified
class Hero < Character
  attr_accessor :equipment
  def initialize(stats = nil, equipment = nil, name = 'noname')
    super(stats, name)
    equipment ||= Equipment.new
    @equipment = equipment
  end

  def use_consumable(consumable)
    @stats.change_stats(consumable.stats, :+)
  end

  def change_wearable(wearable)
    case wearable.type.to_s
    when 'head'
      @equipment.head = wearable
      @stats.change_stats(equipment.head.stats, :+)
    when 'chest'
      @equipment.chest = wearable
      @stats.change_stats(equipment.chest.stats, :+)
    else
      @equipment.boots = wearable
      @stats.change_stats(equipment.boots.stats, :+)
    end
  end

  def change_weapon(weapon)
    @equipment.weapon = weapon
    @stats.change_stats(equipment.weapon.stats, :+)
  end
 # TO BE RETESTED
  def use_item(item)
    case item.class.to_s
    when 'Consumable'
      use_consumable(item)
    when 'Weapon'
      change_weapon(item)
    else
      change_wearable(item)
    end
  end
end
