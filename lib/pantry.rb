class Pantry
  attr_reader :stock

  def initialize
    @stock = Hash.new(0)
  end

  def stock_check(ingredient)
    stock_amount = 0
    @stock.map do |key, value|
        if key == ingredient
          stock_amount += value
        end
    end
    stock_amount
  end

  def restock(ingredient, amount)
    @stock[ingredient] += amount
  end

  def enough_ingredients_for?(recipe)
    recipe.ingredients_required.all? do |key, value|
      stock_check(key) >= value
    end
  end
end
