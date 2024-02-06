require "test_helper"

class Auth::RegistrationsControllerTest < ActionDispatch::IntegrationTest
  test "should create user with valid parameters" do
    user_attributes = FactoryBot.attributes_for(:user)
    assert_difference("User.count") do
      post auth_signup_url, params: {user: user_attributes}, as: :json
    end

    assert_response :success
    assert_equal "User signed up successfully", JSON.parse(response.body)["message"]
  end
end
