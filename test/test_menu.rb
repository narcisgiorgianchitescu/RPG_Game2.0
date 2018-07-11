binpath = File.dirname(__FILE__)
$LOAD_PATH.unshift File.expand_path(File.join(binpath, '..'))
require 'require_file'
require 'test/unit'
require 'menu'
require 'io_interface'

class TestRandomCreator < Test::Unit::TestCase
  def test_valid_input
    device = IOinterface.new
    def device.input
      '1'
    end
    menu = Menu.new(%w[a b c], '', device)
    assert_equal menu.choice, 1
  end

  def test_exit
    device = IOinterface.new
    def device.input
      '-1'
    end
    menu = Menu.new(%w[a b c], '', device)
    assert_equal menu.choice, -1
  end

  def test_invalid_option
    device = IOinterface.new
    def device.input
      ret = if @first
              '1'
            else
              '5'
            end
      @first ||= true
      ret
    end
    menu = Menu.new(%w[a b c], '', device)
    assert_equal menu.choice, 1
  end
end
