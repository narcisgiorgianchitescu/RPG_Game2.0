require_relative 'Item'

# class for differentiating different tipes of wearables
class Wearable < Item

  attr_accessor :type, :hp

  TYPES_NAME = {
    head: 'Cool Helmet',
    chest: 'Awesome Chestplate',
    boots: 'Rainbow Boots'
  }.freeze

  def initialize(stats, type, name = TYPES_NAME[type])
    super(stats, name)
    @hp = 0
    @type = type
  end
end
