require_relative 'Game'
require_relative 'MapGenerator'
require_relative 'Consumable'
require_relative 'Head'
require_relative 'Chest'
require_relative 'Boots'
require_relative 'Weapon'
require_relative 'RandomsGenerator'
# Generating a random map with different tools
class RandomMap < MapGenerator
  def initialize(difficulty = 0)
    # difficulty - 0-10
    @difficulty = difficulty
  end

  def get_map(hero)
    RandomsGenerator.random_map(hero, @difficulty)
  end
end
