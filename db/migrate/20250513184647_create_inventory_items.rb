class CreateInventoryItems < ActiveRecord::Migration[8.0]
  def change
    create_table :inventory_items do |t|
      t.references :ingredient, foreign_key: true
      t.decimal :quantity, precision: 10, scale: 2, default: 0.0
      t.references :updated_by, foreign_key: { to_table: :staff_members }

      t.timestamps
    end
  end
end
