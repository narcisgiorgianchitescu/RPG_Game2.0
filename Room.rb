class Room
  attr_accessor :hidden
  def initialize(hidden = true)
    @hidden = hidden
    @has_money = true
    @index_correction = 1
    @Exit = 0
    @Wait_for_input = -1
  end

  def action(hero)
    @hidden = false
  end

  def show
    puts 'Empty Room'
  end

  def check_option(option, hero)
    if option == @Exit then
      return
    end
  end
end
