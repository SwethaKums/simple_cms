require "test_helper"

class PublicControllerTest < ActionDispatch::IntegrationTest
  test "should get indexshow" do
    get public_indexshow_url
    assert_response :success
  end
end
