class BusStop < ActiveRecord::Base
  acts_as_mappable :default_units => :kms , 
                   :default_formula => :sphere, 
                   :distance_field_name => :distance,
                   :lat_column_name => :stop_lat,
                   :lng_column_name => :stop_lon
                   
  def self.find_near(coords, max_distance = 0.1)
    BusStop.find(:all, :origin =>coords, :within=>max_distance)
  end

end
