require_relative 'Weapon'

class Weapon < Item
  def initialize(stats, name = 'Weapon')
    super(stats, name)
    @stats.hp = 0
  end
end
