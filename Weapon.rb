require_relative 'Weapon'

class Weapon < Item
  def initialize(stats = nil, name = 'Weapon')
    super(stats, name)
    @stats.hp = 0
  end
end
