class ChangeRecipeIngredients < ActiveRecord::Migration[8.0]
  def change
    add_column :recipe_ingredients, :ingredient_id, :bigint
    add_index :recipe_ingredients, :ingredient_id
  end
end
