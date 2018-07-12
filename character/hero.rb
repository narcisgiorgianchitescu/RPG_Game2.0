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

  # TODO: retest
  def use_item(item, free = true)
    case item.class.to_s
    when 'Consumable'
      use_consumable(item, free)
    when 'Weapon'
      change_weapon(item, free)
    else
      change_wearable(item, free)
    end
  end

  def description
    return (super + @equipment.description)
  end

  # private

  def use_consumable(consumable, free = true)
    @stats.change_stats(consumable.stats, :+)
    #@stats.coins -= consumable.stats.coins unless free
  end

  def change_wearable(wearable, free = true)

    case wearable.type.to_s
    when 'head'
      @stats.change_stats(@equipment.head.stats, :-)
      @stats.coins += @equipment.head.stats.coins
      @equipment.head = wearable
      @stats.change_stats(equipment.head.stats, :+)
      @stats.coins -= @equipment.head.stats.coins
    when 'chest'
      @stats.change_stats(@equipment.chest.stats, :-)
      @stats.coins += @equipment.chest.stats.coins
      @equipment.chest = wearable
      @stats.change_stats(equipment.chest.stats, :+)
      @stats.coins -= @equipment.chest.stats.coins
    else
      @stats.change_stats(@equipment.boots.stats, :-)
      @stats.coins += @equipment.boots.stats.coins
      @equipment.boots = wearable
      @stats.change_stats(equipment.boots.stats, :+)
      @stats.coins -= @equipment.boots.stats.coins
    end
    #@stats.coins -= wearable.stats.coins unless free
  end

  def change_weapon(weapon, free = true)
    @stats.change_stats(@equipment.weapon.stats, :-)
    @stats.coins += @equipment.weapon.stats.coins
    @equipment.weapon = weapon
    @stats.change_stats(equipment.weapon.stats, :+)
  #  @stats.coins -= weapon.stats.coins unless free
    @stats.coins += @equipment.weapon.stats.coins
  end

  def take_money(amount)
    @stats.coins -= amount
  end
end
