# Class
class HomeController < ApplicationController
  include LocationHelper

  def index; end

  def locations
    locations = Vehicle.recent_location
    
    render json: locations
  end
end
