require 'test/unit'
require 'net/http'
require_relative '../lib/fetch_meizi'

class FetchMeiziTest < Test::Unit::TestCase
  
  def test_fetch_meizi
    assert Meizi.fetch.match(/\Ahttp.*(jpeg|jpg|gif|png)\Z/) 
  end
  
  def test_fetch_qingchun
    assert Meizi.fetch_qingchun.match(/\Ahttp.*(jpeg|jpg|gif|png)\Z/)
  end
  
  def test_fetch_meizi_should_return_a_visiable_image
    res = Net::HTTP.get_response(URI(Meizi.fetch))
    assert res['content-type'].match(/image\/(jpeg|png|)/)
  end
  
end