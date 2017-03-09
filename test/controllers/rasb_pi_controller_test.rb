require 'test_helper'

class RasbPiControllerTest < ActionDispatch::IntegrationTest
  test "should get se" do
    get rasb_pi_se_url
    assert_response :success
  end

end
