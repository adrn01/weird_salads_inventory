class CreateStaffMembers < ActiveRecord::Migration[8.0]
  def change
    create_table :staff_members do |t|
      t.string :name
      t.date :date_of_birth
      t.string :role
      t.string :iban
      t.string :bic
      t.references :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
