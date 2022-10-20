require "test_helper"

class LinkControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get link_show_url
    assert_response :success
  end
end
