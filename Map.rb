class Map
  def initialize size = 10
    @size = size
    @slots = Array.new(size){Array.new(size)}
  end
  def show
    puts " -"*@size*2
    @size.times do |i|
      print "|"
      @size.times do |j|
        current_slot = @slots[i][j]
        if current_slot.nil? or current_slot.hidden
          print "   "
        else
          print " #{current_slot.class.to_s[0]}"
        end
        print "|"
      end
      puts
      puts " -"*@size*2
    end
  end
end
