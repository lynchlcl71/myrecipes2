require 'test_helper'

class ChefTest < ActiveSupport::TestCase
  
  def setup
    @chef = Chef.new(chefname: "mashrur", emails: "mashrur@example.com")
  end
  
  test "should be valid" do
    assert @chef.valid?
  end
  
  test "name should be present" do
    @chef.chefname = " "
    assert_not @chef.valid?
  end

   test "name should be less than 30 characters" do
    @chef.chefname = "a" * 31
    assert_not @chef.valid?
  end

   test "emails should be present" do
    @chef.emails = " "
    assert_not @chef.valid?
  end

   test "emails should not be too long" do
     @chef.emails = "a" * 245 + "@example.com"
     assert_not @chef.valid?
  end

   test "emails should accept correct format" do
    valid_emails = %w[user@example.com MASHRUR@gmail.com M.first@yahoo.ca john+smith@co.uk.org]
    valid_emails.each do |valids|
      @chef.emails = valids
      assert @chef.valid?, "#{valids.inspect} should be valid"
    end
  end

   test "should reject invalid addresses" do
    invalid_emails = %w[mashrur@example mashrur@example,com mashrur.name@gmail. joe@bar+foo.com]
    invalid_emails.each do |invalids|
      @chef.emails = invalids
      assert_not @chef.valid?, "#{invalids.inspect} should be invalid"
    end
  end 

   test "emails should be unique and case insensitive" do
    duplicate_chef = @chef.dup
    duplicate_chef.emails = @chef.emails.upcase
    @chef.save
    assert_not duplicate_chef.valid?
  end

   test "email should be lower case before hitting db" do
     mixed_emails = "JohN@ExampLe.com"
     @chef.emails = mixed_emails
     @chef.save
     assert_equal mixed_emails.downcase, @chef.reload.emails 
  end
end