require 'test_helper'

class SourceControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get source_new_url
    assert_response :success
  end

  test "should get create" do
    get source_create_url
    assert_response :success
  end

end
