binpath = File.dirname(__FILE__)
$LOAD_PATH.unshift File.expand_path(File.join(binpath, '..'))
require 'require_file'

# end of the game room
class WinRoom < Room
  attr_accessor :you_win

  def initialize(hidden = false, input = [])
    super(hidden, input)
    @description = 'Get here to win'
    @you_win = true
  end

  def action(_hero)
    @you_win
  end
end
