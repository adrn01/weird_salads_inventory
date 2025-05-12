class CreateIngredients < ActiveRecord::Migration[8.0]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.string :unit
      t.decimal :cost, precision: 10, scale: 2

      t.timestamps
    end
  end
end
