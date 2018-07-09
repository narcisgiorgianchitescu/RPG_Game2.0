require_relative 'wearable'
require_relative 'Weapon'

# class for managing hero equipement
class Equipment
  ITEMS = [
    head,
    chest,
    boots,
    weapon,
  ].freeze
  def initialize(items = {})
    ITEMS.each do |item|
      send "#{item}=", (items[item] || Wearable.new(Stats.new, item))
    end
  end
end
