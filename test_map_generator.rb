require 'minitest/autorun'
require_relative 'custom_map'
require_relative 'random_map'
require 'test/unit'

class TestPosition < Test::Unit::TestCase
  def setup; end

  def test_mapgenerator_create_map
    MapGenerator.new.create_map
  end

  def test_custommap_create_map
    CustomMap.new.create_map
  end

  def test_randommap_create_map
    RandomMap.new.create_map(Hero.new, 0)
  end
  # TODO: add others if needed
end
