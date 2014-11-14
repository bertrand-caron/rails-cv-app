namespace 'git' do

  desc "Automates 'git pull' workflow"
  task pull: :environment do
    puts 'Pulling from gitlab'
    puts `git pull`
    puts ''

    Rake::Task['git:prep_server'].invoke
  end

  desc "Automates 'git merge origin/master' workflow for cv-demo"
  task merge: :environment do
    puts "Fetching --all from gitlab'"
    puts `git fetch --all`
    puts ''

    puts "Merging from gitlab's origin/master"
    puts `git merge origin/master`
    puts ''

    Rake::Task['git:prep_server'].invoke
  end

  desc "Automates 'git checkout' workflow. Syntax is 'rake git:pull[8e83b60f0d3d14f9cd4647]'"
  task :checkout, :commit_sha do |_t, args|
    puts "Running git checkout #{args['commit_sha']}"
    puts `git checkout #{args['commit_sha']}`
    puts ''

    Rake::Task['git:prep_server'].invoke
  end

  desc 'Install new gems, recompile assets, run migration and restart unicorn'
  task prep_server: :environment do
    puts 'Updating new User Settings'
    Rake::Task['settings:missing'].invoke
    puts ''

    puts "Running 'sudo bundle install'"
    puts `sudo bundle install`
    puts ''

    puts 'Recompiling assets'
    puts `RAILS_ENV=production bundle exec rake assets:precompile`
    puts ''

    puts 'Running migrations'
    puts `RAILS_ENV=production bundle exec rake db:migrate`
    puts ''

    puts 'Restarting Unicorn Server'
    puts `sudo service #{Settings['service-name']} restart`
    puts ''

    puts 'The following settings have been added from last pull. You might want to update your config/config.yml file to include them.'
    puts `git diff HEAD~1 config/config.yml.example | egrep '^\+'`
    puts ''
  end

end
