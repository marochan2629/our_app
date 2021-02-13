require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get root" do
    get root_path
    assert_response :success
  end
  
  test "should get home" do
    get home_path
    assert_response :success
    assert_select "title", "Home | Pax"
  end
  
  test "should get signup" do
    get signup_path
    assert_response :success
    assert_select "title", "Sign up | Pax"
  end

  test "should get login" do
    get login_path
    assert_response :success
    assert_select "title", "Log in | Pax"
  end
  
  test "should get about_hsp" do
    get about_hsp_path
    assert_response :success
    assert_select "title", "HSPとは？ | Pax"
  end

end
