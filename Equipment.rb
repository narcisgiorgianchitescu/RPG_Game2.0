require_relative 'Item'

class Equipment < Item
  TYPES_NAME = {
    head: 'Cool Helmet',
    chest: 'Awesome Chestplate',
    boots: 'Rainbow Boots'
  }.freeze

  def initialize(stats:, type:, name: 'Equipment')
    stats.hp = 0 if stats.hp != 0
    super(stats, name)
    @type = (TYPES_NAME[type] || 'Undifined Equipment')
  end
end
