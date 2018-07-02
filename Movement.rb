require_relative "Hero"

class Movement
    def initialize hero, map_size
      @hero = hero
      @map_size = map_size
    end

    def print_message
      puts "Press 'a' to go left, 'w' to go up, 's' to go down and 'd' to go right"
    end

    def do_move
      moved = false
      until moved
        print_message
        input = gets.chomp
        case input
        when "a"
          if @hero.position.first > 0
            @hero.goleft
            moved = true
          end
        when "d"
          if @hero.position.first + 1  < @map_size
            @hero.goright
            moved = true
          end
        when "w"
          if @hero.position.last > 0
            @hero.goup
            moved = true
          end
        when "s"
          if @hero.position.last + 1 < @map_size
            @hero.godown
            moved = true
          end
        end
        puts "Can't go there" unless moved
      end
    end
end
