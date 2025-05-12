class CreateModifiers < ActiveRecord::Migration[8.0]
  def change
    create_table :modifiers do |t|
      t.string :name

      t.timestamps
    end
  end
end
