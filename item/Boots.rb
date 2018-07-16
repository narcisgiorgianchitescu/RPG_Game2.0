require_relative 'Equipment'
# Equipment type Boots
class Boots < Equipment
  def initialize(hash_stats = {}, name = 'Boots')
    super(hash_stats, name)
  end
end
