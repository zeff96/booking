class Auth::SessionController < ApplicationController
  def create
    if user = User.authenticate_by(email:params[:user][:email], password:params[:user][:password])
      if !user.confirmed_at
        render json: {error: "Please confirm your account"}, status: :unauthorized
      else
        token = JsonWebToken.encode({sub: user.id})
        cookies.signed[:token] = {
          value: token,
          httponly: true,
          secure: Rails.env.production?,
          same_site: :none,
          expires: 1.hour.from_now,
          path: "/"
        }
        render json: {
        user: {id: user.id, role: user.role},  
        message: 'User logged in successfully!'
      }, status: :ok
      end

    else
      render json: { error: "Invalid credentials.Please try again" }, status: :unauthorized
    end
  end
end
