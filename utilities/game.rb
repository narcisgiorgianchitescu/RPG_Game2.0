binpath = File.dirname(__FILE__)
$LOAD_PATH.unshift File.expand_path(File.join(binpath, '..'))
require 'require_file'
require 'io_interface'
require 'hero'
require 'cursor'
require 'map'
require 'io_terminal'
require 'random_creator'
require 'random_map'

# class that manages a game
class Game
  def initialize(device)
    @device = device
    @hero_cursor = Cursor.new(Position.new(0, 0))
    @hero_position = Position.new(0, 0)
  end

  def start_game
    game_setup
    run_game
    stop_game
  end

  private

  def game_setup
    @device.puts_string 'Input the hero name'
    @hero = Hero.new(name: @device.input)
    @device.clear
    # @device.puts_string 'Input dificulty'
    @map = RandomMap.new.create_map(@hero)
    @map.size.times do |i|
     @map.size.times do |j|
       @map.slots[i][j].set_device @device
     end
   end#room.set_device @device }
  end

  def run_game
    game_over = false
    until game_over
      @device.clear
      #@hero_cursor = Cursor.new(@hero_position)
      @device.print_map(@map, @hero_cursor)
      game_over = do_move
    end
  end

  def stop_game
    @device.clear
    @device.print_string 'End of the game. Here are your stats'
    @device.print_hero @hero
  end

  def do_move
    option = parse
    return true if option == 'exit'
    direction = option
    next_position = @hero_cursor.next direction
    return false unless @map.valid_position? next_position
    @hero_cursor.position = @hero_cursor.move direction
    position = @hero_cursor.position
    room = @map.room position
    room.action @hero
  end

  def parse
    # TODO: replace with a menu
    loop do
      @device.print_string "Input 'left' to go left, 'right' to go right,"\
                         "'down' to go down, 'up' to go up or 'exit' to quit.\n"
      input = @device.input.chomp
      return 'up' if %w[up u].include? input
      return 'down' if %w[down d].include? input
      return 'left' if %w[left l].include? input
      return 'right' if %w[right r].include? input
      return 'exit' if %w[exit e].include? input
    end
  end
end
