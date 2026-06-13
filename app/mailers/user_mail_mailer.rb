class UserMailMailer < ApplicationMailer
    default from: "hello@periwinkle-octipi.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mail_mailer.welcome_email.subject
  #
  def welcome_email
    @user = params[:user]
    @url  = 'http://periwinkle-octipi.com/login'
    mail(
      to: @user.email,
      subject: 'Welcome to Periwinkle Octopi!'
    )
  end
end
