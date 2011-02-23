class TripController < ApplicationController
  def index

    @json = '[
             {"description": "Test", "longitude": "7.70948", "latitude": "45.11663"},
             {"longitude": "7.66026", "latitude": "45.07613" }
            ]'
  end

  def status

  end

  def geocode
    @gc_result = [
    {:lat=>-9.9599095, :lng=>-150.2052861, :matched_address=>"Millennium Island, French Polynesia"}
    ]#Gmaps4rails.geocode(params[:adress])

  end

end
