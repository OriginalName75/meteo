require 'test_helper'

class AjaxLieuControllerTest < ActionDispatch::IntegrationTest
  test "should get meteo" do
    get ajax_lieu_meteo_url
    assert_response :success
  end

end
