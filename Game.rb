require_relative "Map"
require_relative "Hero"
require_relative "Movement"
require_relative "Shop"
require_relative "Hospital"
require_relative "Lair"
require_relative "Vault"
require_relative "Victory_Room"

class Game

  def initialize map = nil, hero = nil
    if map.nil?
      @map = Map.new
    else
      @map = map
    end
    if hero.nil?
      @hero = Hero.new
    else
      @hero = hero
    end
    @movement = Movement.new @hero, @map.size
  end

  def clear_screen
    system "clear" or system "cls"
  end

  def start_game
    @game_over = false
    until @game_over
      clear_screen
      @map.show @hero
      puts
      @hero.showstats
      puts
      @movement.do_move
      result = @map.do_action @hero
      case result
      when "Game Over"
        @game_over = true
        clear_screen
        puts "End of the game"
        if @hero.hp > 0
          puts "You win!"
        else
          puts "You lose!"
        end
        @hero.showstats
        sleep 3
      when "Dead Monster"
        @map.clear_room @hero.position
      end
    end
  end

end
