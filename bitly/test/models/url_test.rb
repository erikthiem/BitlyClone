require 'test_helper'

class UrlTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should save with an address starting with http://" do
      u = Url.new :target => 'http://www.google.com'
      assert u.save
  end

  test "should save with an address starting with https://" do
      u = Url.new :target => 'https://www.google.com'
      assert u.save
  end

  test "should not save with an address starting with www" do
      u = Url.new :target => 'www.google.com'
      assert_not u.save
  end

  test "should start with a click count of 0 after creating a new url" do
      u = Url.new :target => 'http://www.google.com'
      u.save
      assert_equal u.clicks, 0
  end
end
