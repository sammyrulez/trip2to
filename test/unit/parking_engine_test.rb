require 'test/unit'
require "parking_engine"


class ParkingEngineTest  < Test::Unit::TestCase

  def test_for_parking
    p = ParkingEngine.new
    p.engine= HttpGetterEngineParkingMock.new
    parkings = p.available_parkings(45.07243,7.67480)
    assert parkings.length > 0 , 'Parkings should be > 0 according to test data'

  end

end

class HttpGetterEngineParkingMock

  def get(p)
    xml = File.read('test/xml-mock-data/parking-data-test.xml')
    return REXML::Document.new(xml)
  end

end
