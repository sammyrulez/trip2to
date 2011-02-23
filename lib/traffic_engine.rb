require 'http_getter_engine'
require "geo_ruby"
require "http_enginable"

class TrafficEngine

include HttpEnginable

  def is_area_congested(lat, lon)

      base_point = GeoRuby::SimpleFeatures::Point.new
      base_point.x=lon
      base_point.y=lat

      balance = 0
      avarage_speed = 0

      doc = engine.get('http://opendata.5t.torino.it/get_fdt')
      doc.elements.each('traffic_data/FDT_data') do |p|
         actual_point = GeoRuby::SimpleFeatures::Point.new
         actual_point.x= p.attributes['lng'].to_f
         actual_point.y=  p.attributes['lat'].to_f
         distance =  base_point.spherical_distance actual_point
         if distance < 5000

           if p.attributes["direction"] == "positive"
             balance = balance + 1
             avarage_speed = avarage_speed + p.elements["speedflow"].attributes["speed"].to_f

           end
         end
      end
      puts "balance : #{balance}"
      avarage_speed = avarage_speed / balance
      puts "avarage speed : #{avarage_speed}"

      {:balance => balance, :avarage_speed => avarage_speed}


  end

end