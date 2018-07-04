require_relative 'Equipment'
# Equipment type Chest
class Chest < Equipment
  def initialize(attack = 0, defence = 0, value = 0, name = 'Chestplate')
    super(attack, defence, value, name)
  end
end
