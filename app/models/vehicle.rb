class Vehicle < ActiveRecord::Base
  has_many :vehiclereviews, :through => :vehiclereviews
  validates_presence_of :vehicle_number, :transport_mode

  accepts_nested_attributes_for :vehiclereviews
end