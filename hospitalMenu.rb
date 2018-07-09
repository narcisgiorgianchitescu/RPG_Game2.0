require_relative 'menu'

class HospitalMenu
  private

  def print_heal_options
    @values.each.index do |values, x, y|
      string = "#{x + 1}) #{values} hp" if y.zero?
      string = "for #{values} coins" if y == 1
      @device.print_string string
      @device.next_line if y == 1
    end
  end
end
