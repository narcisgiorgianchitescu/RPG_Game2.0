require_relative 'Equipment'

class Chest < Equipment
  def initialize(hash_stats = {}, name = 'Chest')
    super(hash_stats, name)
  end
end
