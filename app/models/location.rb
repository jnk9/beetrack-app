class Location < ApplicationRecord
  belongs_to :vehicle

  validates_presence_of :latitude, :longitude, :send_at
  validates  :latitude, numericality: true
  validates  :longitude, numericality: true
end
