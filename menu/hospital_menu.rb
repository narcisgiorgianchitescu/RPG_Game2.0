binpath = File.dirname(__FILE__)
$LOAD_PATH.unshift File.expand_path(File.join(binpath, '..'))
require 'require_file'
require 'menu'

class HospitalMenu < Menu
  private

  def print_values
    @values.each.index do |values, x, y|
      string = "#{x + 1}) #{values} hp" if y.zero?
      string = "for #{values} coins" if y == 1
      @device.print_string string
      @device.next_line if y == 1
      super
    end
  end
end
