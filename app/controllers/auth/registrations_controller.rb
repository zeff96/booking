class Auth::RegistrationsController < ApplicationController

  def create
    if email_exists?(params["user"]["email"])
      render json: { error: "Email already taken" }, status: :unprocessable_entity
    else
      user = User.new(sign_up_params)
      user.confirmation_token = generate_confirmation_token
      user.confirmation_sent_at = Time.now.utc.iso8601

      if user.save
        UserMailer.confirmation_instructions(user).deliver_later
        render json: { message: "User signed up successfully" }
      else
        render json: { error: "Failed to create user!" }, status: :unprocessable_entity
      end
    end
  end

  def account_confirmation
    user = User.find_by(confirmation_token: params["confirmation_token"])

    if user && !user.confirmed_at
      user.update(confirmed_at: Time.now.utc.iso8601)
      render json: { message: "Account updated successfully" }
    else
      render json: { error: "Invalid confirmation token or account already confirmed" }
    end
  end

  protected

  def sign_up_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :confirmation_token, :confirmation_sent_at)
  end

  def email_exists?(email)
    User.exists?(email: email)
  end

  def generate_confirmation_token
    SecureRandom.urlsafe_base64
  end
end