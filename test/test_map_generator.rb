binpath = File.dirname(__FILE__)
$LOAD_PATH.unshift File.expand_path(File.join(binpath, '..'))
require 'require_file'
require 'minitest/autorun'
require 'map_generator'

class TestPosition < Minitest::Test
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
