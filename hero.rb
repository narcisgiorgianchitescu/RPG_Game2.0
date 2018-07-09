require_relative 'character.rb'
require_relative 'equipment'
# Hero Modified
class Hero < Character
  attr_accessor :equipement
  def initialize(stats = nil, equipement = nil, name = 'noname')
    super(stats, name)
    equipement ||= Equipment.new
    @equipement = equipement
  end
end
