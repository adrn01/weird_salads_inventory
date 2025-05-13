class InventoryItem < ApplicationRecord
  audited

  belongs_to :ingredient
  belongs_to :staff_member, foreign_key: :updated_by
end
