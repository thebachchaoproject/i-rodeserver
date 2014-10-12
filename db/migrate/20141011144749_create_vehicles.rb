class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :vehicle_number, null: false, limit: 12
      t.string :transport_mode

      t.timestamps
    end
    add_index :vehicles, :vehicle_number, unique: true
  end
end
