class Vehicle < ApplicationRecord
  has_many :locations

  validates :license_plate, uniqueness: true, presence: true

  def self.recent_location
    locations = []

    joins(:locations).eager_load(:locations).each do |veh|
      locations << {
        latitude: veh.locations.last.latitude,
        longitude: veh.locations.last.longitude,
        send_at: veh.locations.last.send_at.to_formatted_s(:utc),
        vehicle_identifier: veh.license_plate
      }
    end

    locations
  end
end
