binpath = File.dirname(__FILE__)
$LOAD_PATH.unshift File.expand_path(File.join(binpath, '..'))
require 'require_file'

# ...
class Monster < Character
  attr_accessor :escape_chance
  def initialize(stats = nil, name = 'noname', escpch = 0)
    super(stats, name)
    @escape_chance = escpch
  end
end
