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

  def start_game
    @game_over = false
    until @game_over
      SystemCommands.clear_screen
      @map.show @hero
      puts
      @hero.showstats
      puts
      @movement.do_move
      result = @map.do_action @hero
      case result
      when 'Game Over'
        @game_over = true
        clear_screen
        puts 'End of the game'
        if @hero.hp > 0
          puts 'You win!'
        else
          puts 'You lose!'
        end
        @hero.showstats
        sleep 3
      when 'Dead Monster'
        @map.clear_room @hero.position
      end
    end
  end
end
