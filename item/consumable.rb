binpath = File.dirname(__FILE__)
$LOAD_PATH.unshift File.expand_path(File.join(binpath, '..'))
require 'require_file'
require 'item'

# consumable changes hero stats permanently
class Consumable < Item
  attr_accessor :stats, :name
  def initialize(stats = nil, name = 'Consumable')
    super(stats, name)
  end
end
