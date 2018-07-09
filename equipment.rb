require_relative 'wearable'
require_relative 'Weapon'

# class for managing hero equipement
class Equipment
  ITEMS = %i[
    head
    chest
    boots
    weapon
  ].freeze
  attr_accessor :head
  attr_accessor :chest
  attr_accessor :boots
  attr_accessor :weapon

  def initialize(items = {})
    ITEMS.each do |item|
      send "#{item}=", (items[item] || Wearable.new(Stats.new, item))
    end
  end
end
