require 'test_helper'

class FacilitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get facilities_signup_path
    assert_response :success
  end

end
