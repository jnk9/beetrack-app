class CreateVehicles < ActiveRecord::Migration[5.0]
  def change
    create_table :vehicles do |t|
      t.string :license_plate, unique: true

      t.timestamps
    end
  end
end
