# class that receives a list of options and prompts the io to choose one
class Menu
  def initialize(options)
    @options = options
  end

  def choice
    until choice
      # TODO: send options to io
      # TODO: get result from io
      # TODO: chef if input is valid
    end
    choice
  end
end
