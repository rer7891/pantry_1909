require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require './lib/recipe'
require './lib/pantry'

class PantryTest < Minitest::Test

  def setup
    @pantry = Pantry.new
    @cheese = Ingredient.new("Cheese", "C", 100)
    @mac = Ingredient.new("Macaroni", "oz", 30)
    @mac_and_cheese = Recipe.new("Mac and Cheese")
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)
  end

  def test_it_exists
    assert_instance_of Pantry, @pantry
  end

  def test_it_starts_empty
    assert_equal 0, @pantry.stock.size
    assert_equal Hash, @pantry.stock.class
  end

  def test_it_can_check_stock_levels
    assert_equal 0, @pantry.stock_check(@cheese)
  end

  def test_it_can_restock_pantry
    @pantry.restock(@cheese, 5)
    @pantry.restock(@cheese, 10)
    assert_equal 15, @pantry.stock_check(@cheese)
  end

  def test_if_it_has_enough_ingredients
    @pantry.restock(@cheese, 5)
    @pantry.restock(@cheese, 10)
    assert_equal false,  @pantry.enough_ingredients_for?(@mac_and_cheese)
    @pantry.restock(@mac, 7)
    assert_equal false,  @pantry.enough_ingredients_for?(@mac_and_cheese)
    @pantry.restock(@mac, 1)
    assert_equal true,  @pantry.enough_ingredients_for?(@mac_and_cheese)
  end
end
