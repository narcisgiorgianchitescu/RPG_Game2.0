# experiment
class ConventionTest
  def initialize
    @items = { 0 => 'exit', 1 => 'mar', 2 => 'para', 3 => 'lapte' }
  end

  def list_items
    @items.each { |key, value| puts "#{key} - #{value}" }
  end

  def start
    loop do
      system('cls') || system('clear')
      list_items
      puts 'Pick an option'
      choice = gets.chomp.to_i
      case choice
      when 0
        puts 'Bye'
        exit
      when 1
        puts "You chose #{choice} - #{@items[choice]}"
      when 3
        puts "You chose #{choice} - #{@items[choice]}"
      when 2
        puts "You chose #{choice} - #{@items[choice]}"
      end
      sleep 2
    end
  end
end

test = ConventionTest.new
test.start
