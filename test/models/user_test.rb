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
end
