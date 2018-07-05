require_relative 'Equipment'

class Weapon < Equipment
  def initialize(hash_stats = {}, nume = 'Weapon')
    super(hash_stats, nume)
  end
end
