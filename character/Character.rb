# Character Definition
class Character
  attr_accessor :money
  attr_accessor :hp
  attr_accessor :attack
  attr_accessor :defence
  attr_accessor :name

  def initialize(hash_stats = {})
    @money = hash_stats[:money].nil? ? 50 : hash_stats[:money]
    @hp = hash_stats[:hp].nil? ? 100 : hash_stats[:hp]
    @attack = hash_stats[:attack].nil? ? 10 : hash_stats[:attack]
    @defence = hash_stats[:defence].nil? ? 6 : hash_stats[:defence]
    @name = hash_stats[:name].nil? ? 'noname' : hash_stats[:name]
  end

  def show_stats
    print "Character #{@name} has: \n"
    print "#{@money} Coins \n"
    print "#{@hp} HP\n"
    print "Attack: #{@attack} \nDefence: #{@defence}\n"
  end
end
