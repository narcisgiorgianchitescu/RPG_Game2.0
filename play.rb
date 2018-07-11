binpath = File.dirname(__FILE__)
$LOAD_PATH.unshift File.expand_path(binpath)
require 'require_file'
require 'game'

t = IOterminal.new
g = Game.new t
g.start_game
