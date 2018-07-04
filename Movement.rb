require_relative 'Hero'

# class that allows a hero to move
class Movement
  def initialize(hero, map_size)
    @hero = hero
    @map_size = map_size
  end

  def print_message
    puts "Press 'a' to go left, 'w' to go up, 's' to go down and 'd' to go right
      or 'x' to exit"
  end

  def move_left
    if @hero.position.last > 0
      @hero.goleft
      return true
    end
    false
  end

  def move_right
    if @hero.position.last + 1 < @map_size
      @hero.goright
      return true
    end
    false
  end

  def move_up
    if @hero.position.first > 0
      @hero.goup
      return true
    end
    false
  end

  def move_down
    if @hero.position.first + 1 < @map_size
      @hero.godown
      return true
    end
    false
  end

  def parse_input(input)
    exit if input == 'x'
    moved = move_left if input == 'a'
    moved = move_right if input == 'd'
    moved = move_down if input == 's'
    moved = move_up if input == 'w'
    moved
  end

  def do_move
    moved = false
    until moved
      print_message
      input = gets.chomp
      moved = parse_input input
      puts "Can't go there" unless moved
    end
  end
end
