require 'test_helper'

class FollowControllerTest < ActionDispatch::IntegrationTest
  test "should get source" do
    get follow_source_url
    assert_response :success
  end

  test "should get foll" do
    get follow_foll_url
    assert_response :success
  end

  test "should get unfoll" do
    get follow_unfoll_url
    assert_response :success
  end

end
