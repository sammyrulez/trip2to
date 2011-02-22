class TripController < ApplicationController
  def index
    @json =  {
      'json_class'   => 'Marker',
      'lat'=>45.11663,
      'lng'=>7.70948
      #,'marker_picture' => "http://google-maps-utility-library-v3.googlecode.com/svn/tags/markerclusterer/1.0/images/people35.png"
    }.to_json

    @json = '[
             {"description": "Test", "longitude": "7.70948", "latitude": "45.11663"},
             {"longitude": "7.66026", "latitude": "45.07613" }
            ]'
  end

  def status

  end

  def geocode
    @gcResult = Gmaps4rails.geocode(params[:adress])

  end

end
