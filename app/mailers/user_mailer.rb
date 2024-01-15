class UserMailer < ApplicationMailer
  default from: "notifications@example.com"

  def confirmation_instructions(user)
    @user = user
    @url = "http://localhost:3000/auth/account_confirmation?confirmation_token=#{ @user.confirmation_token }"

    mail(to: @user.email, subject: "Account confirmation")
  end

  def reset_password_instructions(user)
    @user = user
    @url = "http://localhost:3000/auth/edit_password?reset_password_token=#{@user.reset_password_token}"

    mail(to: @user.email, subject: "Reset password instructions")
  end
end
