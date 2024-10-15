require "test_helper"

class KittensControllerTest < ActionDispatch::IntegrationTest
  test "should get resources" do
    get kittens_resources_url
    assert_response :success
  end
end
