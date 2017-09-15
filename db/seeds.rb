10_000.times.each do 
  veh = Vehicle.create(license_plate: Faker::Vehicle.vin)

  20.times.each do
    Location.create(
      vehicle_id: veh.id,
      latitude: Faker::Address.latitude,
      longitude: Faker::Address.longitude,
      send_at: Faker::Date.between(2.days.ago, Date.today)
    )
  end
end
