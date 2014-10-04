class UserMailer < ActionMailer::Base
  helper UserMailerHelper
  helper ApplicationHelper
  helper ProgrammingSkillsHelper

  def send_contact_email(email, content)
    @email = email
    @content = content
    mail(from: @email, to: Settings['email'], subject: "New mail from #{Settings['domain-name']}")
  end

  def send_follower_email(follower)
    @educations = Education.all
    mail(from: Settings['email'], to: follower.email, subject: "#{Settings['name']} Résumé")
  end
end
