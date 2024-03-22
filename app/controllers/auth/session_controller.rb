class Auth::SessionController < ApplicationController
  def create
    user = User.find_by(email: params["user"]["email"])

    if user && !user.confirmed_at
      render json: { error: "Please confirm you account email before signing in!" }
    else
      if user&.authenticate(params["user"]["password"])
        render json: {
          token: JsonWebToken.encode({sub: user.id, name: user.username, email: user.email}),
        }, status: :ok
      else
        render json: { error: "Invalid credentials.Please try again" }, status: :unauthorized
      end
    end
  end
end