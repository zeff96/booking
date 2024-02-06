require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "should not save user without valid username" do
    user = User.new
    assert_not user.save, "Saved without valid name"
  end

  test "should not save user without valid email" do
    user = User.new(username: "test")
    assert_not user.save, "Saved without valid email"
  end

  test "should not save user with duplicate email" do
    user_1 = User.new(username: "test1", email: "test1@gmail.com", password: "password")
    user_2 = User.new(username: "test2", email: "test1@gmail.com", password: "password")

    user_1.save!

    assert_not user_2.save, "Saved with duplicate email"
  end
end
