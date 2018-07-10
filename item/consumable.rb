binpath = File.dirname(__FILE__)_relative
$LOAD_PATH.unshift File.expand_path(File.join(binpath, '..'))
require 'require_file'
require 'item'

class Consumable < Item
  attr_accessor :stats, :name
  def initialize(stats = nil, name = 'Consumable')
    super(stats, name)
  end
end
