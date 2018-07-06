require_relative 'Weapon'

class Weapon < Item
  def initialize(stats, name = 'Weapon')
    stats.hp = 0 if stats.hp != 0
    super(stats, name)
  end
end
