binpath = File.dirname(__FILE__)
$LOAD_PATH.unshift File.expand_path(File.join(binpath, '..'))
require 'require_file'
require 'wearable'
require 'weapon'

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
      # TODO: weapon initialization is missing
      send "#{item}=", (items[item] || Wearable.new(Stats.new, item))
    end
  end

  def description(show_value = true)
    output = 'Head: ' + @head.description(show_value)
    output += 'Chest: ' + @chest.description(show_value)
    output += 'Boots: ' + @boots.description(show_value)
    output += 'Weapon: ' + @weapon.description(show_value)
    output
  end
end
