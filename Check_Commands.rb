module CheckCommands
  def self.check_if_between(from_this_one, to_this_one, option)
    if (from_this_one..to_this_one) === option then
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
