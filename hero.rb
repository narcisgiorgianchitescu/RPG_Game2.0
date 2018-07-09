require_relative 'character.rb'
require_relative 'equipment'
require_relative 'Consumable'
require_relative 'wearable'
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
    when 'chest'
      @equipment.chest = wearable
    else
      @equipment.boots = wearable
    end
  end

  def change_weapon(weapon)
    @equipment.weapon = weapon
  end

  def print_stats
    puts @stats.hp
    puts @stats.attack
    puts @stats.defence
    puts @stats.coins
    puts
    puts @equipment.head.stats.hp
    puts @equipment.head.stats.attack
    puts @equipment.head.stats.defence
    puts @equipment.head.stats.coins
    puts
    puts @equipment.chest.stats.hp
    puts @equipment.chest.stats.attack
    puts @equipment.chest.stats.defence
    puts @equipment.chest.stats.coins
    puts
    puts @equipment.boots.stats.hp
    puts @equipment.boots.stats.attack
    puts @equipment.boots.stats.defence
    puts @equipment.boots.stats.coins
    puts
    puts @equipment.weapon.stats.hp
    puts @equipment.weapon.stats.attack
    puts @equipment.weapon.stats.defence
    puts @equipment.weapon.stats.coins
  end
end

h = Hero.new

w = Wearable.new
w.type = 'head'
w.stats.hp = 10

h.change_wearable(w)

w = Wearable.new
w.type = 'boots'
w.stats.defence = 1000
h.change_wearable(w)

w = Wearable.new
w.type = 'head'
w.stats.hp = 4

h.change_wearable(w)

h.print_stats
