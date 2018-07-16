require_relative 'Character.rb'

# Monster Definition
class Monster < Character
  def initialize(hash_stats = {}, escape_chance = 1)
    super(hash_stats)
    @escape_chance = escape_chance
  end

  def show_stats
    super
    print "Escape Chance: #{@escape_chance} \n"
  end
end
