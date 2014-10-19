namespace 'settings' do

  desc 'Initializes UserSettings' 
  task :init => :environment do
    u = UserSettings
    u.page_title = 'Curriculum Vitae'
    u.full_name = 'John Doe'
    u.main_occupation = 'Web Developer'
    u.alt_occupation = 'Secret Agent ?'
    u.contact_email = 'admin@local.host'
  end
end
