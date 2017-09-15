# Class
class GenerateLocationJob < ApplicationJob
  queue_as :default

  # this create an location of a vehicle via gps
  # find if exist a vehicle or create it
  def perform(location)
    vehicle = Vehicle.where(license_plate: location[:vehicle_identifier]).first_or_create

    vehicle.locations.create(
      latitude: location[:latitude],
      longitude: location[:longitude],
      send_at: DateTime.parse(location[:send_at])
    )
  end
end
