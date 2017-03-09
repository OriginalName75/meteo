require 'test_helper'

class AjaxUserControllerTest < ActionDispatch::IntegrationTest
  test "should get changeImg" do
    get ajax_user_changeImg_url
    assert_response :success
  end

  test "should get changeAutre" do
    get ajax_user_changeAutre_url
    assert_response :success
  end

  test "should get cropImg" do
    get ajax_user_cropImg_url
    assert_response :success
  end

end
