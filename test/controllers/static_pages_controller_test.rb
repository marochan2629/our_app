require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get root" do
    get root_url
    assert_response :success
  end
  
  test "should get home" do
    get static_pages_home_url
    assert_response :success
    assert_select "title", "Home | Pax"
  end
  
  test "should get signup" do
    get static_pages_signup_url
    assert_response :success
    assert_select "title", "Sign up | Pax"
  end

  test "should get login" do
    get static_pages_login_url
    assert_response :success
    assert_select "title", "Log in | Pax"
  end

end
