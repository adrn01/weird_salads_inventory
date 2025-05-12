class Location < ApplicationRecord
  has_many :menu_items
  has_many :staff_members
end
