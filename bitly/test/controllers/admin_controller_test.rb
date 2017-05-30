require 'test_helper'

class AdminControllerTest < ActionController::TestCase

  include Devise::Test::ControllerHelpers

  setup do
    @user = users(:one)
    @adminuser = users(:two)
  end

  test "should redirect to homepage if signed in but not admin" do
    sign_in @user
    get :index
    assert_redirected_to "/"
  end

  test "should go to admin page if signed in as an admin" do
    sign_in @adminuser
    get :index
    assert_response :success
  end

  test "should go to login page if not signed in" do
    get :index
    assert_redirected_to "/login"
  end

end
