class Item  
  def initialize(att=0, defe=0, val=0, nume="noname")  
     
    @attack = att 
    @defence = defe
	@value = val
	@name = nume
  end  
  
  def show (a=0, index=99) 
	puts " "
    print "#{index}. " if index!=99 
	print "#{@name}: #{@attack} dmg, #{@defence} def"
	print " - #{@value} coins" if(a==1)
  end  
   
end

a=Item.new
a.show(0,1)