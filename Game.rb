require_relative "Map"
require_relative "Hero"
require_relative "Movement"

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
      @map.show
      @movement.do_move
      @map.do_action @hero
    end
  end

end

game = Game.new
game.start_game
