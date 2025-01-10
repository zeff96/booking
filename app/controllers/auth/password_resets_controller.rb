class Auth::PasswordResetsController < ApplicationController
  before_action :set_user_by_token, only: [:password_update]
  def create
    if user = User.find_by(email: params[:user][:email])
      UserMailer.with(
        user: user,
        token: user.generate_token_for(:password_reset)
      ).reset_password_instructions.deliver_later
      render json: {message: "Password reset sent successfully!"}
    else
      render json: {error: "Invalid email. Please try again!"}, status: :unprocessable_entity
    end
  end

  def password_update
    if @user.update(update_params)
      render json: {message: "Password reset successful"}
    else
      render json: {error: "Failed to reset password"}, status: :unprocessable_entity
    end
  end

  private
  def set_user_by_token
    @user = User.find_by_token_for(:password_reset, params[:token])
  end

  def update_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end