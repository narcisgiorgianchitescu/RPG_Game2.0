binpath = File.dirname(__FILE__)
$LOAD_PATH.unshift File.expand_path(File.join(binpath, '..'))
require 'require_file'
require 'test/unit'
require 'random_creator'
require 'menu'

class TestRandomCreator < Test::Unit::TestCase
  def setup
    @menu = Menu.new([], ' ')
  end
  #TODO: test_choice, print_values, values_on_type


end
