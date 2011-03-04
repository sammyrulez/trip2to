require "traffic_engine"
require "parking_engine"

class TripController < ApplicationController

  
  def index


  end

  def status

  end

  def evalTrip
    
  end

  def geocode
#    @gc_result = [
#    {:lat=>-9.9599095, :lng=>-150.2052861, :matched_address=>"Millennium Island, French Polynesia"}
#    ]

    geo_result = Gmaps4rails.geocode("Torino #{params[:adress]}")

    if(geo_result.length > 1)
      @adresses = geo_result
      @original = params[:adress]

    else
      result = geo_result[0]
      map_data = [{"description" => result[:matched_address], "longitude" => result[:lng], "latitude"=> result[:lat], "picture" => "/images/destination_marker.png"}]

      @center_log = result[:lng]
      @center_lat = result[:lat]


      t = TrafficEngine.new
      @traffic_data = t.is_area_congested( result[:lat], result[:lng])
      p = ParkingEngine.new
      @parking_data = p.available_parkings(result[:lat], result[:lng])
      @parking_data.each_value{|park|

        map_data << {"description" => park['name'], "longitude" => park['lng'], "latitude"=> park['lat'], "picture" => "/images/parking_marker.png"}

      }

      @bus_stops = BusStop.find_near([result[:lat], result[:lng]],0.3)
      @bus_stops.each {|stop|

        map_data << {"description" => stop.stop_name, "longitude" => stop.stop_lon, "latitude"=> stop.stop_lat, "picture" => "/images/bus_marker.png"}


      }

      puts(map_data)
      @json = map_data.to_json
      render(:template => "trip/destination_map")
    end



  end


   def private init_engines

     @traffic_engine = TrafficEngine.new
     @parking_engine = ParkingEngine.new

   end

end
