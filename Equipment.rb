require_relative 'Item'
# Item type Equipment
class Equipment < Item
  def initialize(hash_stats = {}, name = 'Some Equipment')
    super(hash_stats, name)
  end
end
