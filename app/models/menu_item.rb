class MenuItem < ApplicationRecord
  has_one :recipe
  belongs_to :location
  has_one :modifier, optional: true

  default_scope { where(location_id: Constants::LOCATION_ID) }
end
