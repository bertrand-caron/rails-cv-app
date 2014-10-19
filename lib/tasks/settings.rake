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
  end
end
