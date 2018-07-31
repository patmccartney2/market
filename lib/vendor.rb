class Vendor

  attr_reader :inventory,
              :name,
              :quantity

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(produce)
    @inventory[produce]
  end

  def stock(name, quantity)
    @inventory[name] += quantity
  end

end
