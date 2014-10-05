namespace 'git' do
  desc "Automates 'git pull' workflow"
  task :pull => :environment do
    puts "Pulling from gitlab"
    puts `git pull`
    puts ''

    puts "Running 'bundle install'"
    puts `bundle install`
    puts ''

    puts "Recompiling assets"
    puts `RAILS_ENV=production bundle exec rake assets:precompile`
    puts ''

    puts "Running migrations"
    puts `RAILS_ENV=production bundle exec rake db:migrate`
    puts ''

    puts "Restarting Unicorn Server"
    puts `sudo service cv restart`
    puts ''
  end

  desc "Automates 'git checkout' workflow. Syntax is 'rake git:pull[8e83b60f0d3d14f9cd4647]'"
  task :checkout, :commit_sha do |t,args|
    puts "Running git checkout #{args['commit_sha']}"
    puts `git checkout #{args['commit_sha']}`
    puts ''

    puts "Restarting Unicorn Server"
    puts `sudo service cv restart`
    puts ''
  end
end
