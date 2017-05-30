require 'test_helper'

class UrlsControllerTest < ActionDispatch::IntegrationTest
  include Devise::TestHelpers

  setup do
    @url = urls(:one)
    sign_in @user
  end

  test "should get index" do
    get urls_url
    assert_response :success
  end

  test "should get new" do
    get new_url_url
    assert_response :success
  end

  test "should create url" do
    assert_difference('Url.count') do
      post urls_url, params: { url: { :target => "http://www.google.com" } }
    end

    assert_redirected_to "/"
  end

  test "should increment the click count when a url shortcode is hit" do
      get "/go/" + @url.shortcode
      assert_equal 1, @url.reload.clicks
  end

  test "should redirect to target when go/shortcode is hit" do
      get "/go/" + @url.shortcode
      assert_redirected_to @url.target
  end
end
