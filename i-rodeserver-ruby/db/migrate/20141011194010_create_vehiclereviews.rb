class CreateVehiclereviews < ActiveRecord::Migration
  def change
    create_table :vehiclereviews do |t|
      t.datetime :date_of_travel
      t.string :gps_or_location
      t.string :driver_name
      t.integer :safety_rating, limit: 1
      t.text :review
      t.string :photolink, limit: 500
      t.belongs_to :vehicle, index: true

      t.timestamps
    end
  end
end
