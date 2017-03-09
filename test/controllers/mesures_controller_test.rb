require 'test_helper'

class MesuresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get mesures_index_url
    assert_response :success
  end

end
