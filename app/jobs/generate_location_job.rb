class GenerateLocationJob < ApplicationJob
  queue_as :default

  #this create an location of a vehicle via gps, find if exist a vehicle or create it
  def perform(location)
    @vehicle = Vehicle.find_or_initialize_by(license_plate: location[:vehicle_identifier])
    @vehicle.locations.new(latitude: location[:latitude], longitude: location[:longitude], send_at: DateTime.parse(location[:send_at]))
    @vehicle.save
  end
end
