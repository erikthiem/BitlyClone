require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase

  include Devise::Test::ControllerHelpers

  setup do
    @user = users(:one)
  end

  test "should get welcome page if not logged in" do
    get :index
    assert_response :success
  end

  test "should get url listing page if logged in" do
      sign_in @user
      get :index
      assert_redirected_to "/urls"
  end

end
