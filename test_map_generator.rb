require 'minitest/autorun'
require_relative 'custom_map'

class TestPosition < Minitest::Test
  def setup; end

  def test_mapgenerator_get_map
    MapGenerator.new.create_map
  end

  def test_custommap_get_map
    CustomMap.new.create_map
  end
  # TODO: add others if needed
end
