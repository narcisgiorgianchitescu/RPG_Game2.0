module CheckCommands
  def self.check_if_between(this_interval, option)
    option >= this_interval.first && option < this_interval.last
  end

  def self.check_if_buyer_has_enough_money(buyer, object_value)
    buyer.money >= object_value
  end
end
