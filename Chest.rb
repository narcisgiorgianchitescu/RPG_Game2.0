require_relative 'Equipment'
# Equipment type Chest
class Chest < Equipment
  def initialize(hash_stats = {}, name = 'Chest')
    super(hash_stats, name)
  end
end
