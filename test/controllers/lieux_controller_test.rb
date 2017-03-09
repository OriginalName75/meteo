require 'test_helper'

class LieuxControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get lieux_index_url
    assert_response :success
  end

end
