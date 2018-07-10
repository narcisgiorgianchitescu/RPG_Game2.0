require_relative 'character.rb'

# ...
class Monster < Character
  attr_accessor :escape_chance
  def initialize(stats = nil, name = 'noname', escpch = 0)
    super(stats, name)
    @escape_chance = escpch
  end
end
