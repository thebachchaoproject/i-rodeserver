class Vehicle < ActiveRecord::Base
  has_many :vehiclereviews
  validates_presence_of :vehicle_number, :transport_mode

  accepts_nested_attributes_for :vehiclereviews, allow_destroy: true, reject_if: Proc.new { |a| a[:safety_rating].blank? }
end