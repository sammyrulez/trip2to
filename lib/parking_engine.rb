require 'http_getter_engine'
require "geo_ruby"
require "http_enginable"


class ParkingEngine
  include HttpEnginable

  def available_parkings(lat,lot)

    doc = @engine.get('http://opendata.5t.torino.it/get_fdt')


  end

end
