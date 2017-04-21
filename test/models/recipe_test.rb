require 'test_helper'

class RecipeTest < ActiveSupport::TestCase

  def setup
    @chef = Chef.create!(chefname: "mashrur", emails: "mashrur@example.com")
    @recipe = @chef.recipes.build(name: "vegetable", discription: "great vegetable recipe")
  end

  test "recipe without chef should be invalid" do    
    @recipe.chef_id = nil
    assert_not @recipe.valid?
  end

  test "recipe should be valid" do    
    assert @recipe.valid?   
  end

  test "name should be present" do  
    @recipe.name = " "
    assert_not @recipe.valid?  
  end

  test "discription should be present" do  
    @recipe.discription = " "
    assert_not @recipe.valid?  
  end

  test "discription should not be less than 5 characters" do    
    @recipe.discription = "a" * 3
    assert_not @recipe.valid?
end

 test "discription should not be more than 500 characters" do     
    @recipe.discription = "a" * 501
    assert_not @recipe.valid?
end

end