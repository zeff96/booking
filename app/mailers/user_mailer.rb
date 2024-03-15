class UserMailer < ApplicationMailer
  default from: "notifications@example.com"

  def confirmation_instructions(user)
    @user = user
    @url = auth_account_confirmation_url(confirmation_token: @user.confirmation_token)

    mail(to: @user.email, subject: "Account confirmation")
  end

  def reset_password_instructions(user)
    @user = user
    @url = "/edit_password?reset_password_token=#{@user.reset_password_token}"

    mail(to: @user.email, subject: "Reset password instructions")
  end
end
