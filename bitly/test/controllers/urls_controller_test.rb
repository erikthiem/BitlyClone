require 'test_helper'

class UrlsControllerTest < ActionController::TestCase # ActionDispatch::IntegrationTest

    include Devise::Test::ControllerHelpers

  setup do
    @url = urls(:one)
    @user = users(:one)
    sign_in @user
    request.host = 'http://localhost:3000'
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create url" do
    assert_difference('Url.count') do
      post :create, params: { url: { :target => "http://www.google.com" } }
    end

    assert_redirected_to "/"
  end

  test "should increment the click count when a url shortcode is hit" do
      get :go, params: {shortcode: @url.shortcode}
      assert_equal 1, @url.reload.clicks
  end

  test "should redirect to target when go/shortcode is hit" do
      get :go, params: {shortcode: @url.shortcode}
      assert_redirected_to @url.target
  end
end
