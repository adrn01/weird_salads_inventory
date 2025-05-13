class InventoryItem < ApplicationRecord
  audited comment_required: true

  belongs_to :ingredient
  belongs_to :staff_member, foreign_key: :updated_by_id, optional: true

  UPDATE_REASONS_INCREASE = [
    "Delivery Received",
    "Stocktake"
  ].freeze

  UPDATE_REASONS_DECREASE = [
    "Sale",
    "Stocktake",
    "Waste"
  ].freeze
end
