class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.float :latitude
      t.float :longitude
      t.timestamp :send_at
      t.references :vehicle, foreign_key: true

      t.timestamps
    end
  end
end
