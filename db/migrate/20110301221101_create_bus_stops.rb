class CreateBusStops < ActiveRecord::Migration
  def self.up
    create_table :bus_stops do |t|
      t.string :stop_id
      t.string :stop_code
      t.string :stop_name
      t.string :stop_desc
      t.float :stop_lat
      t.float :stop_lon
      t.string :stop_url


      t.timestamps
    end
  end

  def self.down
    drop_table :bus_stops
  end
end
