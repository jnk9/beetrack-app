class HomeController < ApplicationController

  def index
  end

  def get_locations
    locations_recent = Location.order(send_at: :desc).group(:vehicle_id)
    @locations = []

    locations_recent.map do |location|
      object = Hash[latitude: location.latitude , longitude: location.longitude , send_at: location.send_at.to_formatted_s(:utc) , vehicle_identifier: location.vehicle.license_plate]
      @locations << object
    end

    render json: @locations
  end
end
