require_relative 'Equipment'
# Equipment type Head
class Head < Equipment
  def initialize(attack = 0, defence = 0, value = 0, name = 'Helmet')
    super(attack, defence, value, name)
  end
end
