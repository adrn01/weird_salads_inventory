class MenuItem < ApplicationRecord
  belongs_to :recipe
  belongs_to :location
  belongs_to :modifier, optional: true

  default_scope { where(location_id: Constants::LOCATION_ID) }
end
