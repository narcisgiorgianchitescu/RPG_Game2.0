# class for different items type of objects
class Item
  attr_accessor :attack
  attr_accessor :defence
  attr_accessor :value

  def initialize(attack = 0, defence = 0, value = 0, name = 'Some item')
    @attack = attack
    @defence = defence
    @value = value
    @name = name
  end

  def show(show_value = true)
    print "#{@name}: #{@attack} dmg, #{@defence} def"
    print " - #{@value} coins" if show_value == true
  end
end
