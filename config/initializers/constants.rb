# frozen_string_literal: true

module Constants
  # Location identifier for the current instance
  LOCATION_ID = ENV.fetch("LOCATION_ID", nil)&.to_i
end
