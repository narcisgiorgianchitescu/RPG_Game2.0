binpath = File.dirname(__FILE__)
$LOAD_PATH.unshift File.expand_path(File.join(binpath, '..'))
require 'require_file'
require_relative 'item'

# class for differentiating wearables
class Wearable < Item
  attr_accessor :type, :hp

  TYPES_NAME = {
    head: 'Cool Helmet',
    chest: 'Awesome Chestplate',
    boots: 'Rainbow Boots'
  }.freeze

  def initialize(stats = nil, type = :head, name = TYPES_NAME[type])
    super(stats, name)
    @hp = 0
    @type = type
  end
end
