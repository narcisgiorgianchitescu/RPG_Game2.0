class Room
  attr_accessor :hidden
  def initialize(hidden = true)
    @hidden = hidden
  end

  def action(hero)
    @hidden = false
  end

  def show()
  end

  def check_option(option, hero)
    if option == @Exit then
      return
    end
  end
end
