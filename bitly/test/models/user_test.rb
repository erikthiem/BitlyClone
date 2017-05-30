require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should create a new User" do
      user = User.new(
        email: "test@email.com",
        password: "test123",
        password_confirmation: "test123"
      )

      assert user.save
  end

  test "should not create a new User if the password is empty" do
      user = User.new(
        email: "test@email.com",
        password: "",
        password_confirmation: ""
      )

      assert_not user.save
  end

  test "should not create a new User if the username is empty" do
      user = User.new(
        email: "",
        password: "test123",
        password_confirmation: "test123"
      )

      assert_not user.save
  end

  test "should not create a new User if the password does not match the confirmation" do
      user = User.new(
        email: "test@email.com",
        password: "test123",
        password_confirmation: "test1234"
      )

      assert_not user.save
  end

  test "should not allow a duplicate email" do
      user = User.create(
        email: "test@email.com",
        password: "test123",
        password_confirmation: "test1234"
      )

      user_duplicate = User.new(
        email: "test@email.com",
        password: "test123",
        password_confirmation: "test1234"
      )

      assert_not user_duplicate.save
  end

end
