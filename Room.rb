class Room
  attr_accessor :hidden
  def initialize(hidden = true)
    @hidden = hidden
    @has_money = true
    @index_correction = 1
    @EXIT = 0
    @WAIT_FOR_INPUT = -1
  end

  def action(hero)
    @hidden = false
  end

  def show
    puts 'Empty Room'
  end

  def check_option(option, hero)
    if option == @EXIT then
      return
    end
  end
end
