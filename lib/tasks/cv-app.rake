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

    puts "Restarting Unicorn Server"
    puts `sudo service cv restart`
    puts ''
  end
end
