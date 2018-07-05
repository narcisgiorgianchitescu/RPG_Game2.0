# Character Definition
class Character
  attr_accessor :money
  attr_accessor :hp
  attr_accessor :attack
  attr_accessor :defence

  def initialize(money = 0, my_name = 'noname', hitpoints = 100,
                 attack = 1, defence = 1)
    @money = money
    @name = my_name
    @hp = hitpoints
    @attack = attack
    @defence = defence
  end

  def show_stats
    print "Character #{@name} has: \n"
    print "#{@money} Coins \n"
    print "#{@hp} HP\n"
    print "Attack: #{@attack} \nDefence: #{@defence}\n"
  end
end
