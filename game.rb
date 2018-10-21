binpath = File.dirname(__FILE__)
$LOAD_PATH.unshift File.expand_path(binpath)
require 'require_file'
require 'io_interface'
require 'hero'
require 'cursor'
require 'map'
require 'io_terminal'
require 'random_creator'
require 'random_map'
require 'custom_map'
require 'stats'

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

  def string_is_number?(string)
    string == string.to_i.to_s
  end

  def set_hero
    @device.clear
    @device.puts_string 'Input the hero name'
    stats = Stats.new(attack: 15, defence: 10, hp: 100, coins: 25)
    Hero.new(stats, nil, @device.input.chomp)
  end

  def set_difficulty(range = (0..10), recommended_difficulty = 4)
    @device.clear
    option = 0
    loop do
      @device.puts_string "Input dificulty - between #{range.min} to #{range.max} - preferable #{recommended_difficulty}"
      option = @device.input
      break if (range.include? option.to_i) && string_is_number?(option.to_s)

      @device.clear
    end
    option.to_i
  end

  def set_map(difficulty, size)
    map = RandomMap.new.create_map @hero, difficulty, size
    map.size.times do |i|
      map.size.times do |j|
        map.slots[i][j].set_device @device
      end
    end
    map
  end

  def game_setup
    @hero = set_hero
    difficulty = set_difficulty
    size = set_size
    @map = set_map(difficulty, size)
  end

  def set_size
    @device.clear
    option = 0
    loop do
      @device.puts_string 'Introduce the size of the map (between 8 and 20)'
      option = @device.input
      break if ((8..20).cover? option.to_i) && string_is_number?(option.to_s.chomp)

      @device.clear
    end
    option.to_i
  end

  def run_game
    game_over = false
    until game_over
      @device.clear
      @device.print_map(@map, @hero_cursor)
      @device.print_string(@hero.description)
      @device.next_line
      game_over = do_move
    end
  end

  def stop_game
    @device.clear
    @device.puts_string 'End of the game. Here are your stats'
    @device.print_hero @hero
  end

  def do_move
    option = parse
    return true if option == 'exit'

    direction = option
    next_position = @hero_cursor.next direction
    return false unless @map.valid_position? next_position

    @hero_cursor.move direction
    position = @hero_cursor.position
    room = @map.room position
    room.action @hero
  end

  def parse
    # TODO: replace with a menu
    description = 'Choose an option: '
    directions = {
      'up' => 'or w to go up',
      'down' => 'or s to go down',
      'left' => 'or a to go left',
      'right' => 'to or d go right',
      'exit' => 'to exit',
      'a' => nil,
      's' => nil,
      'd' => nil,
      'w' => nil
    }
    Menu.new(directions, description, @device).choice(false)
  end
end
