class CreateMenuItems < ActiveRecord::Migration[8.0]
  def change
    create_table :menu_items do |t|
      t.decimal :price, precision: 10, scale: 2
      t.references :recipe, null: false, foreign_key: true
      t.references :location, null: false, foreign_key: true
      t.references :modifier, null: false, foreign_key: true

      t.timestamps
    end
  end
end
