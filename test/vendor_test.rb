require './lib/vendor'
require 'pry'
require 'minitest/autorun'
require 'minitest/pride'

class VendorTest < Minitest::Test

  def test_existence
    vendor = Vendor.new("Rocky Mountain Fresh")
    assert_instance_of Vendor, vendor
  end

  def test_vendor_starts_empty
    vendor = Vendor.new("Rocky Mountain Fresh")
    assert_equal ({}), vendor.inventory
  end

  def test_name
    vendor = Vendor.new("Rocky Mountain Fresh")
    assert_equal "Rocky Mountain Fresh", vendor.name
  end

  def test_check_stock_and_zero_default
    vendor = Vendor.new("Rocky Mountain Fresh")
    assert_equal 0, vendor.check_stock("Peaches")
  end

  def test_stock
    vendor = Vendor.new("Rocky Mountain Fresh")
    vendor.stock("Peaches", 25)
    assert_equal 25, vendor.check_stock("Peaches")
    vendor.stock("Peaches", 25)
    assert_equal 50, vendor.check_stock("Peaches")
    vendor.stock("Tomatoes", 12)
    assert_equal 12, vendor.check_stock("Tomatoes")
  end

  def test_inventory_is_hodling_stock
    vendor = Vendor.new("Rocky Mountain Fresh")
    vendor.stock("Peaches", 25)
    vendor.stock("Peaches", 25)
    vendor.stock("Tomatoes", 12)
    assert_equal ({"Peaches"=>50, "Tomatoes"=>12}), vendor.inventory
  end

end
