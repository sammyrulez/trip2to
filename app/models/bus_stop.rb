class BusStop < ActiveRecord::Base

  scope :near, lambda{ |origin_lat, origin_lng ,within|
      
                        origin_lat = deg2rad(origin_lat)
                        origin_lng =  deg2rad(origin_lng)
                        {
                        :conditions => %(
                          (ACOS(COS(#{origin_lat})*COS(#{origin_lng})*COS(RADIANS(bus_stops..stop_lat))*COS(RADIANS(bus_stops..stop_lon))+
                          COS(#{origin_lat})*SIN(#{origin_lng})*COS(RADIANS(bus_stops.stop_lat))*SIN(RADIANS(bus_stops.stop_lon))+
                          SIN(#{origin_lat})*SIN(RADIANS(bus_stops.stop_lat)))*3963) <= #{within}
                        ),
                        :select => %( bus_stops.*,
                          (ACOS(COS(#{origin_lat})*COS(#{origin_lng})*COS(RADIANS(bus_stops.stop_lat))*COS(RADIANS(bus_stops.stop_lon))+
                          COS(#{origin_lat})*SIN(#{origin_lng})*COS(RADIANS(bus_stops.stop_lat))*SIN(RADIANS(bus_stops.stop_lat))+
                          SIN(#{origin_lat})*SIN(RADIANS(bus_stops.stop_lat)))*3963) AS distance
                        )
                      }
    }

  private
  def self.deg2rad(deg)
	  (deg * Math::PI / 180)
  end

end
