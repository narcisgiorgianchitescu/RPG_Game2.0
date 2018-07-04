require_relative 'Item'
# Item type Equipment
class Equipment < Item
  def initialize(attack = 0, defence = 0, value = 0, name = 'Some Equipment')
    super(attack, defence, value, name)
  end
end
