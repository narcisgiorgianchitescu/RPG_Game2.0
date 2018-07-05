module CheckCommands
  def self.check_if_between(this_interval, option)
    if option >= this_interval.first and option < this_interval.last then
      true
    else
      false
    end
  end

  def self.check_if_buyer_has_enough_money(buyer, object_value)
    if buyer.money >= object_value
      true
    else
      false
    end
  end
end
