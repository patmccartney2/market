class Market

  attr_reader :name,
              :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    names = []
    @vendors.each do |vendor|
      names << vendor.name
    end
    return names
  end

  def vendors_that_sell(item)
    vendors = []
    @vendors.each do |vendor|
      if vendor.inventory.include?(item)
        vendors << vendor
      end
    end
    return vendors
  end

  def sorted_item_list
    item_names = []
    @vendors.each do |vendor|
      item_names << vendor.inventory.keys
    end
    item_names.sort.flatten.uniq
  end

  def total_inventory
    all_inventories = []
    @vendors.each do |vendor|
      all_inventories << vendor.inventory
    end
    result = []
    all_inventories.each_with_index do |inventory, index|
      inventory.merge(all_inventories[index + 1]){|key, oldval, newval| newval + oldval}
    end
  end

end
