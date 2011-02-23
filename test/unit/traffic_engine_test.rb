require 'test/unit'
require 'traffic_engine'


class TrafficEngineTest < Test::Unit::TestCase

  def test_for_congested
        t = TrafficEngine.new
        t.engine= HttpGetterEngineTrafficMock.new
        out = t.is_area_congested(45.11606,7.70910)
        assert_equal(73,out[:balance],"Wrong balance")
        assert(out[:avarage_speed] > 29,"Avarage speed to loo for test data")

  end

   def test_for_truth
    assert true
  end

end

class HttpGetterEngineTrafficMock

  def get(p)

    xml = File.read('test/xml-mock-data/traffic-data-test.xml')
    return REXML::Document.new(xml)


  end

end
