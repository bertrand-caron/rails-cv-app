class UserMailer < ActionMailer::Base
  helper UserMailerHelper
  helper ApplicationHelper
  helper ProgrammingSkillsHelper

  def send_contact_email(email, content)
    @email = email
    @content = content
    mail(from: @email, to: UserSettings.contact_email, subject: "New mail from #{Settings['domain-name']}")
  end

  def send_follower_email(follower)
    @educations = Education.all
    mail(from: UserSettings.contact_email, to: follower.email, subject: "#{UserSettings.full_name} Résumé")
  end
end
