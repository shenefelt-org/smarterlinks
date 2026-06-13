# Preview all emails at http://localhost:3000/rails/mailers/user_mail_mailer
class UserMailMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/user_mail_mailer/welcome_email
  def welcome_email
    UserMailMailer.welcome_email
  end
end
