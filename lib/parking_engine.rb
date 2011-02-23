require 'http_getter_engine'
require "geo_ruby"
require "http_enginable"


class ParkingEngine
  include HttpEnginable

  def available_parkings(lat,lon)

     base_point = GeoRuby::SimpleFeatures::Point.new
     base_point.x=lon
     base_point.y=lat

     parkings = {}

    doc = engine.get('http://opendata.5t.torino.it/get_pk')


    doc.elements.each('td:traffic_data/td:PK_data') do |p|

       actual_point = GeoRuby::SimpleFeatures::Point.new
       actual_point.x= p.attributes['lng'].to_f
       actual_point.y=  p.attributes['lat'].to_f
       distance =  base_point.spherical_distance actual_point
       if distance < 500 and  p.attributes['Free'].to_i > 1
         parkings[p.attributes['ID']] = {'lng' =>  p.attributes['lng'] ,'lat' =>   p.attributes['lat'] , 'free' => p.attributes['Free'] , 'name' =>  p.attributes['Name'] , 'total' =>  p.attributes['Total'] }
       end

    end

    parkings


  end

end
