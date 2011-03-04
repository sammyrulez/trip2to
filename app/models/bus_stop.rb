class BusStop < ActiveRecord::Base
   acts_as_mappable :default_units => :kms,
                   :default_formula => :sphere,
                   :distance_field_name => :distance,
                   :lat_column_name => :stop_lat,
                   :lng_column_name => :stop_lon
                   
  def self.find_near(coords, max_distance = 0.5)
    BusStop.within(max_distance,:origin =>coords)

  end

  def distance_in_mt()
    if distance
      return (distance * 1000).round
    end
  end

end
