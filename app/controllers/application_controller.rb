class ApplicationController < ActionController::API
  attr_reader :current_user

  private

  def authenticate_user!
    token = JsonWebToken.decode(auth_token)
    @current_user = User.find(token["data"]["sub"])
  rescue JWT::ExpiredSignature
    render json: { error: "Auth token has expired" }
  rescue JWT::DecodeError
    render json: { error: "Invalid auth token" }
  end

  def auth_token
    auth_header = request.headers["authorization"]
    if auth_header.present?
      token = auth_header.split(" ").last
    else
      token = nil 
    end
    token
  end
end
