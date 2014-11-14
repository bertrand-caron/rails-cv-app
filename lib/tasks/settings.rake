namespace 'settings' do

  params_hash = {
    page_title: 'Curriculum Vitae',
    full_name: 'James Bond',
    main_occupation: 'Secret Agent',
    alt_occupation: 'Killing Vilains ?',
    contact_email: 'admin@local.host',
    mobile_phone: '0 123 456 7 8',
    address: '61 Horsen Ferry Road, London S1',
    infos: '42 years old, can breath underwater',
    github_name: 'john-doe',
    stackoverflow_id: '1234567',
    stackoverflow_name: 'jdoe',
    twitter_alias: 'John-Doe',
    linkedIn_alias: 'johndoe',
    main_color: '34BA9C',
    secondary_color: '428bca',
    profile_section: 'Licensed to kill Secret Agent looking for trouble in <span itemprop="adr">Brisbane</span>',
    profile_picture: ''
  }

  desc 'Initializes UserSettings'
  task init: :environment do
    u = UserSettings
    params_hash.each do |key, value|
      u.set_param_to(key, value)
    end
  end

  desc 'Initializes missing UserSettings and leaves other untouched'
  task missing: :environment do
    u = UserSettings
    params_hash.each do |key, value|
      u.init_param_to(key, value)
    end
  end
end
