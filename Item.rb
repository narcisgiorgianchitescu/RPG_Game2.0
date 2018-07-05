# class for different items type of objects
class Item
  attr_accessor :attack
  attr_accessor :defence
  attr_accessor :value

  def initialize(hash_stats = {}, name = 'Some item')
    @attack = hash_stats[:attack].nil? ? 2 : hash_stats[:attack]
    @defence = hash_stats[:defence].nil? ? 2 : hash_stats[:defence]
    @value = hash_stats[:value].nil? ? 20 : hash_stats[:value]
    @name = name
  end

  def show(show_value = true)
    print "#{@name}: #{@attack} dmg, #{@defence} def"
    print " -> #{@value} coins" if show_value
  end
end
