require 'test_helper'

class V1ControllerTest < ActionDispatch::IntegrationTest
  test "should get sessions_controller" do
    get v1_sessions_controller_url
    assert_response :success
  end

end
