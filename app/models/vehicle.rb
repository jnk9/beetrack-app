class Vehicle < ApplicationRecord
  has_many :locations

  validates :license_plate, uniqueness: true, presence: true
end
