require 'test/unit'
require_relative '../lib/fetch_meizi'

class FetchMeiziTest < Test::Unit::TestCase
  
  def test_fetch_meizi
    assert Meizi.fetch.match(/\Ahttp.*(jpeg|jpg|gif|png)\Z/) 
    assert Meizi.fetch_qingchun.match(/\Ahttp.*(jpeg|jpg|gif|png)\Z/) 
  end
  
end