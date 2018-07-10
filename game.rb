require_relative 'iointerface'

# class that manages a game
class Game
  def initialize(device)
    @device = device
    @hero_position = Position.new(0, 0)
  end

  def start_game
    game_setup
    run_game
  end

  private

  def game_setup
    @device.print 'Input the hero name'
    @hero = Hero.new(name: @device.input)
    @device.clear
    @device.print 'Input dificulty'
    @map = RandomCreator.random_map(@hero)
    @map.each { |room| room.set_device @device }
  end

  def run_game
    game_over = false
    until game_over
      @device.clear
      @device.print_map @map
      game_over = do_move
    end
    stop_game
  end

  def stop_game
    @device.clear
    @device.print_string 'End of the game. Here are your stats'
    @device.print_hero @hero
  end

  def do_move
    option = parse
    return false if option.nil? || option == 'exit'
    row, column = @hero_position.next(direction)
    return false unless @map.valid_position? row column
    @hero_position.move(direction)
    # TODO: do action for room
  end

  def parse
    @device.print_string "Input 'left' to go left, 'right' to go right,"\
                         "'down' to go down, 'up' to go up or 'exit' to quit."
    input = @device.input
    return 'up' if %w[up u].include? input
    return 'down' if %w[down d].include? input
    return 'left' if %w[left l].include? input
    return 'right' if %w[right r].include? input
    return 'exit' if %w[exit e].include? input
  end
end
