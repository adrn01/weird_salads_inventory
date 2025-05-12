class MenuItem < ApplicationRecord
  belongs_to :recipe
  belongs_to :location
  belongs_to :modifier, optional: true
end
