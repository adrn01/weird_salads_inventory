class CreateModiferOptions < ActiveRecord::Migration[8.0]
  def change
    create_table :modifer_options do |t|
      t.string :name
      t.decimal :price, precision: 10, scale: 2
      t.references :modifier, null: false, foreign_key: true

      t.timestamps
    end
  end
end
