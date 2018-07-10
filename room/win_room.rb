binpath = File.dirname(__FILE__)
$LOAD_PATH.unshift File.expand_path(File.join(binpath, '..'))
require 'require_file'

class WinRoom < Room
  attr_accessor :you_win

  def initialize(hidden = true, input = [])
    super(hidden, input)
    @description = 'Get here to win'
    @you_win = 'You Win!'
  end

  def action(hero)
    @you_win
  end
end
