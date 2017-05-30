require 'test_helper'

class UrlTest < ActiveSupport::TestCase

  include Devise::Test::IntegrationHelpers

  setup do
      @user = users(:one)
      sign_in @user
  end

  # test "the truth" do
  #   assert true
  # end
  test "should save with an address starting with http://" do
      u = Url.new :target => 'http://www.google.com', :user_id => @user.id
      assert u.save
  end

  test "should save with an address starting with https://" do
      u = Url.new :target => 'https://www.google.com', :user_id => @user.id
      assert u.save
  end

  test "should not save with an address starting with www" do
      u = Url.new :target => 'www.google.com'
      assert_not u.save
  end

  test "should not save with an address that is not a valid URI" do
      u = Url.new :target => 'http://^&*'
      assert_not u.save
  end

  test "should not save with a non-responsive URL" do
      u = Url.new :target => 'http://a.b'
      assert_not u.save
  end

  test "should start with a click count of 0 after creating a new url" do
      u = Url.new :target => 'http://www.google.com'
      u.save
      assert_equal u.clicks, 0
  end

end
