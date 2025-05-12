class CreateRecipeIngredients < ActiveRecord::Migration[8.0]
  def change
    create_table :recipe_ingredients do |t|
      t.decimal :quantity, precision: 10, scale: 2
      t.references :recipe, null: false, foreign_key: true
      t.references :ingredients, null: false, foreign_key: true

      t.timestamps
    end
  end
end
