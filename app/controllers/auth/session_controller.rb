class Auth::SessionController < ApplicationController
  def create
    if user = User.authenticate_by(email:params[:user][:email], password:params[:user][:password])
      if !user.confirmed_at
        render json: {error: "Please confirm your account"}, status: :unauthorized
      else
        access_token = JsonWebToken.generate_access_token(user.id)
        refresh_token = JsonWebToken.generate_refresh_token(user.id)

        RefreshToken.create!(
          user_id: user.id, 
          token: refresh_token,
          expiry: 24.hours.from_now, 
          )
        render json: {
          user: {id: user.id, role: user.role},
          token: access_token,
          refresh_token: refresh_token,
          message: 'User logged in successfully!'
        }, status: :ok
      end

    else
      render json: { error: "Invalid credentials.Please try again" }, status: :unauthorized
    end
  end
end
