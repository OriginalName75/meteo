require 'test_helper'

class ListeLieuControllerTest < ActionDispatch::IntegrationTest
  test "should get all" do
    get liste_lieu_all_url
    assert_response :success
  end

end
