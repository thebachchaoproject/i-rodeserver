class Vehiclereview < ActiveRecord::Base
  belongs_to :vehicle, dependent: :destroy

  validates_presence_of :date_of_travel, :gps_or_location
end
