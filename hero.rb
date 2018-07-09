require_relative 'character.rb'
require_relative 'equipment'
# Hero Modified
class Hero < Character
  attr_accessor :equipment
  def initialize(stats = nil, equipment = nil, name = 'noname')
    super(stats, name)
    equipment ||= Equipment.new
    @equipment = equipment
  end
end
