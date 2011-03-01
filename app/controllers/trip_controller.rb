require "traffic_engine"
require "parking_engine"

class TripController < ApplicationController

  
  def index

    @json = '[
             {"description": "Test", "longitude": "7.70948", "latitude": "45.11663"},
             {"longitude": "7.66026", "latitude": "45.07613" }
            ]'
  end

  def status

  end

  def evalTrip
    
  end

  def geocode
#    @gc_result = [
#    {:lat=>-9.9599095, :lng=>-150.2052861, :matched_address=>"Millennium Island, French Polynesia"}
#    ]

    geo_result = Gmaps4rails.geocode(params[:adress])

    if(geo_result.length > 1)
      @adresses = geo_result
      @original = params[:adress]

    else
      result = geo_result[0]
      @json = [{"description" => result[:matched_address] , "longitude" => result[:lng], "latitude"=> result[:lat]}].to_json

      t = TrafficEngine.new
      @traffic_data = t.is_area_congested( result[:lat], result[:lng])
      p = ParkingEngine.new
      @parking_data = p.available_parkings(result[:lat], result[:lng])

      render(:template => "trip/destination_map")
    end



  end


   def private init_engines

     @traffic_engine = TrafficEngine.new
     @parking_engine = ParkingEngine.new

   end

end
