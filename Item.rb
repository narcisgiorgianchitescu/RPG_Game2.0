Dir["lib/**.*"].each { |file| require_relative file }

class Item  
  def initialize(att=0, defe=0, val=0, nume="noname")  
     
    @attack = att 
    @defence = defe
	@value = val
	@name = nume
  end  
  
  def show (a=0) 
	puts " "
    print "#{@name}: #{@attack} dmg, #{@defence} def"
	if(a==1)
		print " - #{@value} coins"
	end
  end  
   
end
