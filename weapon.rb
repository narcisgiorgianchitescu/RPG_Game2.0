require_relative 'stats'

class Weapon < Item
  def initialize(stats = nil, name = 'Weapon')
    stats ||= Stats.new
    stats.hp = 0 if stats.hp != 0
    super(stats, name)
  end
end
