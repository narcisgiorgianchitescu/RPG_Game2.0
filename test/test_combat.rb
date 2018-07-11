binpath = File.dirname(__FILE__)
$LOAD_PATH.unshift File.expand_path(File.join(binpath, '..'))
require 'require_file'
require 'hero'
require 'monster'
require 'minitest/autorun'

class TestCombat < Minitest::Test
  
end
