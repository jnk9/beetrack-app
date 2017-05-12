class Api::V1::GpsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  # method for the background task
  def create
    GenerateLocationJob.perform_later(location_params)
  end

  private

  def location_params
    params.permit(:latitude, :longitude, :send_at, :vehicle_identifier).to_h
  end
end
