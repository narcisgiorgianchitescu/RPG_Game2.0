require_relative 'Map'
require_relative 'Hero'
require_relative 'Movement'
require_relative 'Shop'
require_relative 'Hospital'
require_relative 'Lair'
require_relative 'Vault'
require_relative 'Victory_Room'
require_relative 'System_Commands'

# class that creates a game with a map and a hero
class Game
  include SystemCommands
  def initialize(map = Map.new, hero = Hero.new)
    @map = map
    @hero = hero
    @movement = Movement.new @hero, @map.size
  end

  def print_info
    SystemCommands.clear_screen
    @map.show @hero
    puts
    @hero.show_stats
    puts
  end

  def stop_game(won)
    SystemCommands.clear_screen
    if won
      puts 'You win!'
    else
      puts 'You lose!'
    end
    @hero.show_stats
  end

  def parse_result(result)
    if result == 'Game Over'
      stop_game(@hero.hp > 0)
      return true
    end

    if result == 'Dead Monster'
      @map.clear_room @hero.position
      return false
    end
  end

  def start_game
    game_over = false
    until game_over
      print_info
      @movement.do_move
      result = @map.do_action @hero
      game_over = parse_result result
    end
  end
end
