class UserMailer < ActionMailer::Base

  def send_email(email, content)
    @email = email
    @content = content
    mail(from: @email, to: Settings['email'], subject: "New mail from #{Settings['domain-name']}")
  end
end
