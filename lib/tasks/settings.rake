namespace 'settings' do

  desc 'Initializes UserSettings' 
  task :init => :environment do
    u = UserSettings
    u.page_title = 'Curriculum Vitae'
    u.full_name = 'John Doe'
    u.main_occupation = 'Web Developer'
    u.alt_occupation = 'Secret Agent ?'
    u.contact_email = 'admin@local.host'
    u.mobile_phone = '0 123 456 7 8'
    u.address = '61 Horsen Ferry Road, London S1'
    u.infos = '42 years old, can breath underwater'
    u.github_name = 'john-doe'
    u.stackoverflow_id = '1234567'
    u.stackoverflow_name = 'jdoe'
    u.twitter_alias = 'John-Doe'
    u.linkedIn_alias = 'johndoe'
    u.main_color = 'f09819'
    u.secondary_color = '428bca'
    u.profile_section = 'Licensed to kill Secret Agent looking for trouble'
  end

  desc 'Initializes missing UserSettings and leaves other untouched' 
  task :missing => :environment do
    u = UserSettings
    u.page_title = 'Curriculum Vitae' unless u.page_title
    u.full_name = 'John Doe' unless u.full_name
    u.main_occupation = 'Web Developer' unless u.main_occupation
    u.alt_occupation = 'Secret Agent ?' unless u.alt_occupation
    u.contact_email = 'admin@local.host' unless u.contact_email
    u.mobile_phone = '0 123 456 7 8' unless u.mobile_phone
    u.address = '61 Horsen Ferry Road, London S1' unless u.address
    u.infos = '42 years old, can breath underwater' unless u.infos
    u.github_name = 'john-doe' unless u.github_name
    u.stackoverflow_id = '1234567' unless u.stackoverflow_id
    u.stackoverflow_name = 'jdoe' unless u.stackoverflow_name
    u.twitter_alias = 'John-Doe' unless u.twitter_alias
    u.linkedIn_alias = 'johndoe' unless u.linkedIn_alias
    u.main_color = 'f09819' unless u.main_color
    u.secondary_color = '428bca' unless u.secondary_color
    u.profile_section = 'Licensed to kill Secret Agent looking for trouble' unless u.profile_section
  end
end
