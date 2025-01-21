class Auth::RegistrationsController < ApplicationController

  PASSWORD_REGEX = /\A(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[@!#\$])[a-zA-Z0-9@!#\$]{8,20}\Z/

  def create
    if email_exists?(params["user"]["email"])
      render json: { error: "Email already taken" }, status: :unprocessable_entity
    elsif params["user"]["password"] !~ PASSWORD_REGEX
      render json: {error: "Password does not meet complexity"}, status: :unprocessable_entity
    else
      user = User.new(sign_up_params)

      if user.save
        UserMailer.with(
          user: user,
          token: user.generate_token_for(:email_confirmation)
        ).email_confirmation.deliver_later
    
        render json: { 
          message: "User signed up successfully"
        }
      else
        render json: { error: "Failed to create user!" }, status: :unprocessable_entity
      end
    end
  end

  def confirm
    if(user = User.find_by_token_for(:email_confirmation, params[:token]))
      user.update(confirmed_at: Time.now.iso8601) unless user.confirmed_at
      render json: {message: "Email confirmed successfully!"}
    else
      render json: { error: "Invalid or expired token"}, status: :unprocessable_entity
    end    
  end

  def resend_email_confirmation
    if user = User.find_by(email: params[:user][:email])
      UserMailer.with(
        user: user,
        token: user.generate_token_for(:email_confirmation)
      ).email_confirmation.deliver_later
      render json: {message: "Email confirmation sent successfully!"}
    else
      render json: {error: "Could not find user with given email.Please try again!" }, status: :unprocessable_entity
    end
  end
  protected

  def sign_up_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  def email_exists?(email)
    User.exists?(email: email)
  end
end
