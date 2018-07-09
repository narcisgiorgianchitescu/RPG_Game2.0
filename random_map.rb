require_relative 'Hero'
require_relative 'random_creator'

# Generating a random map with different tools
class RandomMap
  def create_map(hero, difficulty)
    RandomCreator.random_map(hero, difficulty)
  end
end
