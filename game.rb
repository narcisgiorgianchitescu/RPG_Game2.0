require_relative 'iointerface'

# class that manages a game
class Game
  def initialize(device)
    @device = device
  end

  def game_setup
    @device.print 'Input the hero name'
    @hero = Hero.new(name: @device.input)
    @device.clear
    @device.print 'Input dificulty'
    @map = RandomCreator.random_map(@hero)
  end

  def start_game
    game_setup
  end
end
