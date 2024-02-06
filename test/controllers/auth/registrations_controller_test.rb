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

  test "should not create user with duplicate email" do
    existing_user = FactoryBot.create(:user)

    assert_no_difference("User.count") do
      post auth_signup_url, params: { user: { username: "test1", email: existing_user.email, password: "password" } }, as: :json
    end

    assert_response :unprocessable_entity
    assert_equal "Email already taken", JSON.parse(response.body)["error"]
  end
end
