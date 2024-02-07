require "test_helper"

class MotorcirclesControllerTest < ActionDispatch::IntegrationTest
  test "should create motorcircle for logged in user" do
    user = FactoryBot.create(:user)
    motorcircle_attributes = FactoryBot.attributes_for(:motorcircle)

    post auth_login_url params: { user: { email: user.email, password: user.password } }


    token = JSON.parse(response.body)["token"]

    assert_not_nil token, "Token should not be nil"

    assert_difference("Motorcircle.count") do
      post motorcircles_url, params: { motorcircle: motorcircle_attributes},
      headers: { "authorization" => "Bearer #{token}" }
    end

    assert_response :created
    assert_equal "created successfully!", JSON.parse(response.body)["message"]
  end
end
