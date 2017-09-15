module ApplicationHelper
  def fetch_recent_location
    vehicles = $redis.get('vehicles')
    if vehicles.nil?
      vehicles = Vehicle.recent_location.to_json
      $redis.set('vehicles', snippets)
      $redis.expire('vehicles', 5.hours.to_i)
    end
    JSON.load vehicles
  end
end
