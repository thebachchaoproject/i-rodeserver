class AddAvgratingToVehicles < ActiveRecord::Migration
  def change
    add_column :vehicles, :average_rating, :decimal, precision: 5, scale: 2, default: 0
  end
end
