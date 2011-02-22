require 'test/unit'
require 'httparty'
require 'traffic_engine'


class TrafficEngineTest < Test::Unit::TestCase

  def test_for_congested
        t = TrafficEngine.new
        t.engine= HttpGetterEngineMock.new
        t.is_area_congested(45.11606,7.70910)
        assert true
  end

   def test_for_truth
    assert true
  end

end

class HttpGetterEngineMock

  def get(p)

    xml = File.read('test/xml-mock-data/traffic-data-test.xml')
    return REXML::Document.new(xml)


  end

end
