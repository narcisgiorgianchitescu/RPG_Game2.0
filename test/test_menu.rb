binpath = File.dirname(__FILE__)
$LOAD_PATH.unshift File.expand_path(File.join(binpath, '..'))
require 'require_file'
require 'test/unit'
require 'menu'
require 'io_interface'

class TestRandomCreator < Test::Unit::TestCase
  def test_valid_input_array
    device = IOinterface.new
    def device.input
      '1'
    end
    menu = Menu.new(%w[a b c], '', device)
    assert_equal menu.choice, 1
  end

  def test_exit_array
    device = IOinterface.new
    def device.input
      '-1'
    end
    menu = Menu.new(%w[a b c], '', device)
    assert_equal menu.choice, -1
  end

  def test_invalid_option_array
    device = IOinterface.new
    def device.input
      ret = if @first
              '1'
            else
              'l'
            end
      @first ||= true
      ret
    end
    menu = Menu.new(%w[a b c], '', device)
    assert_equal menu.choice, 1
  end

  def test_valid_input_hash
    device = IOinterface.new
    def device.input
      'a'
    end
    choices = { 'a' => 'choice a', 'b ' => 'choice b' }
    menu = Menu.new(choices, '', device)
    assert_equal menu.choice, 'a'
  end

  def test_invalid_option_hash
    device = IOinterface.new
    def device.input
      ret = if @first
              'f'
            else
              'a'
            end
      @first ||= true
      ret
    end
    choices = { 'a' => 'choice a', 'b ' => 'choice b' }
    menu = Menu.new(choices, '', device)
    assert_equal menu.choice, 'a'
  end
end
