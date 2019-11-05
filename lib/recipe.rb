class Recipe
  attr_reader :name, :ingredients_required

  def initialize(name)
    @name = name
    @ingredients_required = {}
  end

  def add_ingredient(ingredient, amount_required)
    @ingredients_required[ingredient] = amount_required
  end

  def amount_required(ingredient)
    @ingredients_required.find do |key, value|
      return value if key == ingredient
    end
  end

  def ingredients
    @ingredients_required.map {|key, value| key }
  end

  def total_calories
    calorie_count = @ingredients_required.map do |key, value|
      key.calories * value
    end
    calorie_count.sum { |calories| calories }
  end


end
