# helper module
module SystemCommands
  def self.clear_screen
    system('cls') || system('clear')
  end

  def self.sleep_for_seconds(seconds)
    sleep(seconds)
  end
end
