require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "should not save user without valid username" do
    user = User.new
    assert_not user.save, "Saved without valid name"
  end
end
