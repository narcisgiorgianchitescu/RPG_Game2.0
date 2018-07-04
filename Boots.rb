require_relative 'Equipment'
# Equipment type Boots
class Boots < Equipment
  def initialize(attack = 0, defence = 0, value = 0, name = 'Boots')
    super(attack, defence, value, name)
  end
end
