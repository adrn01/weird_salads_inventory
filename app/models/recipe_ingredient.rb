class RecipeIngredient < ApplicationRecord
  belongs_to :recipe
  has_one :ingredient
end
