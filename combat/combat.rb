binpath = File.dirname(__FILE__)
$LOAD_PATH.unshift File.expand_path(File.join(binpath, '..'))
require 'require_file'
require 'menu'

class Combat
  def initialize(hero, monster, device); end

  def fight; end
end
