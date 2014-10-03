class UserMailer < ActionMailer::Base

  def send_contact_email(email, content)
    @email = email
    @content = content
    mail(from: @email, to: Settings['email'], subject: "New mail from #{Settings['domain-name']}")
  end

  def send_follower_email(follower)
  end
end
