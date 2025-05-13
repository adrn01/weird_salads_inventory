class StaffMember < ApplicationRecord
  belongs_to :location

  default_scope { where(location_id: Constants::LOCATION_ID) }
end
