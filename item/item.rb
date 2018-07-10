binpath = File.dirname(__FILE__)
$LOAD_PATH.unshift File.expand_path(File.join(binpath, '..'))
require 'require_file'
require 'stats'

class Item
  attr_accessor :stats, :name
  def initialize(stats = nil, name = 'Item')
    stats ||= Stats.new
    @stats = stats
    @name = name
  end
end
