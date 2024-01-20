class Auth::PasswordsController < ApplicationController
  def reset_password
    user = User.find_by(email: params["user"]["email"])
    user.reset_password_token = generate_reset_password_token
    user.reset_password_sent_at = Time.now.utc.iso8601

    if user.save!

      UserMailer.reset_password_instructions(user).deliver_later

      render json: { message: "Reset password token sent successfully!" }
    else
      render json: { error: "Email address not found!" }
    end
  end

  def update_password
    user = User.find_by(reset_password_token: params["user"]["reset_password_token"])

    if user
      user.update(password: params["user"]["password"])
      render json: { message: "Reset password successful" }
    else
      render json: { error: "Invalid reset password token!" }
    end
  end


  protected

  def generate_reset_password_token
    SecureRandom.urlsafe_base64
  end
end