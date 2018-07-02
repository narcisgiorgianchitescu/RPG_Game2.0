require_relative "Room"

class Map

  def initialize size = 10
    @size = size
    @slots = Array.new(size){Array.new(size)}
  end

  def print_slot slot
    if slot.nil? or slot.hidden
      print "   "
    else
      print " #{slot.class.to_s[0]}"
    end
    print "|"
  end

  def show
    puts " -"*@size*2
    @size.times do |i|
      print "|"
      @size.times do |j|
        current_slot = @slots[i][j]
        print_slot current_slot
      end
      puts
      puts " -"*@size*2
    end
  end

  def do_action position
    @slots[poisition.first][position.last].action
  end

end
