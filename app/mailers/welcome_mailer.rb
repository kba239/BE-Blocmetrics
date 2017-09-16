class WelcomeMailer < ApplicationMailer
  def welcome_send(user)
    @user = user
    mail(to: user.email, subject: "Thank you for registering!")
  end
end
