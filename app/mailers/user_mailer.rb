class UserMailer < ApplicationMailer
  default from: "notifications@example.com"

  def email_confirmation
    @user = params[:user]
    mail(to: @user.email, subject: "Email Confirmation")
  end


  def reset_password_instructions()
    @user = params[:user]
    mail(to: @user.email, subject: "Reset password instructions")
  end
end
