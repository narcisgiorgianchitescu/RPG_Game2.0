require_relative 'Room'

class Hospital < Room
  def initialize(hidden = true, input = [])
    super(hidden, input)
    @description = 'Hospital, you can heal ypu wounds here'
  end

  def action
    #nothing for now
  end
end
