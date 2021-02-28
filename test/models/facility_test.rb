require 'test_helper'

class FacilityTest < ActiveSupport::TestCase
  def setup
    @facility = Facility.new(name: "Example Facility", email: "facility@example.com", phone_number: "09876543210",
    password: "foobar", password_confirmation: "foobar")
  end

  test "should be valid" do
    assert @facility.valid?
  end
  
  test "name should be present" do
    @facility.name = "     "
    assert_not @facility.valid?
  end
  
  test "email should be present" do
    @facility.email = "     "
    assert_not @facility.valid?
  end
  
  test "name should not be too long" do
    @facility.name = "a" * 51
    assert_not @facility.valid?
  end

  test "email should not be too long" do
    @facility.email = "a" * 244 + "@example.com"
    assert_not @facility.valid?
  end
  
   test "email validation should accept valid addresses" do
    valid_addresses = %w[facility@example.com FACILITY@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @facility.email = valid_address
      assert @facility.valid?, "#{valid_address.inspect} should be valid"
    end
  end
  
  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[facility@example,com facility_at_foo.org facility.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @facility.email = invalid_address
      assert_not @facility.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end
  
  test "email addresses should be unique" do
    duplicate_user = @facility.dup
    @facility.save
    assert_not duplicate_user.valid?
  end
  
  test "password should be present (nonblank)" do
    @facility.password = @facility.password_confirmation = " " * 6
    assert_not @facility.valid?
  end

  test "password should have a minimum length" do
    @facility.password = @facility.password_confirmation = "a" * 5
    assert_not @facility.valid?
  end
end
