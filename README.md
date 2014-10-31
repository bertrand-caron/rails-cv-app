# Installation

## Overview

The following components will be set up:

1. Packages / Dependencies
1. Ruby
1. System Users
1. Database
1. CV Application
1. Nginx

## 3.System Users

Create a `cv` user for the CV App:

    sudo adduser --disabled-login --gecos 'CV App' cv

## 4. CV App

    # We'll install the CV App into home directory of the user "cv"
    cd /home/cv

### Clone the Source

    # Clone CV App repository
    sudo -u cv -H git clone git@gitlab.bcaron.me:root/cv-app.git

### Configure It

    # Go to CV App installation folder
    cd /home/cv/cv-app

    # Copy the example config
    sudo -u cv -H cp config/config.yml.example config/config.yml

    # Update config file
    sudo -u cv -H editor config/config.yml

    # If you plan on using piwik, also copy the following file
    sudo -u cv -H cp config/piwik.yml.example config/piwik.yml
    # And update it with your settings
    sudo -u cv -H editor config/piwik.yml

### Install Gems

If the 'bundler' gem is not installed yet, do it:

    # Install Bundler gem
    sudo -u cv -H gem install bundler

Then install all the necessary gems:

    # Install Gems
    sudo -u cv -H bundle install

### Set the secret key

    # Copy the template secrets.yml file
    sudo -u cv -H cp config/secrets.yml.example config/secrets.yml

    # Open the secret file, and enter a valid secret key as explaiend in the comments
    sudo -u cv -H editor config/secrets.yml

### Migrate database
    # Run the necessary database migrations
    sudo -u cv -H rake db:migrate RAILS_ENV=production


### Create First User

    # Go to the CV rails app folder
    cd ~cv/cv
    # Open the rails console
    RAILS_ENV=production rails console
    # Create your first user
    # 'irb(main):001:0>' is the console prompt
    irb(main):001:0> user=User.create!(:email=>'admin@local.host',:name=>'Admin',:password=>'foobar')
    # Exit the rails console
    irb(main):001:0> exit

### Initialize User Settings

    # Run the rake tasks
    RAILS_ENV=production bundle exec rake settings:init


### Precompile assets

    # Precompile the assets, as needed for production environment
    sudo -u cv -H bundle exec rake assets:precompile RAILS_ENV=production

### Test the App

At the point, you should be able to fire the app with `RAILS_ENV=production rails server`
ant test it at localhost:3000.

### Use your credentials to sign in and start adding items

Sign in at `your_cv_app_url/signin` using the credentials your generated.

Signing in grants you an additional button in the navbar, Models, giving you access to
the different sections (Education, Internships, etc.).

### Set up Unicorn Server

Copy the example config, and modify it if necessary.

    # Copy the example config
    sudo -u cv -H cp config/unicorn.rb.example config/unicorn.rb
    # If you are not using the default user ('cv') or directory (/home/cv'), you need to modify it
    sudo -u cv -H editor config/unicorn.rb

### Install Init Script

Copy the init script (will be `/etc/init.d/cv`):

    sudo cp lib/support/init.d/cv /etc/init.d/cv

Make CV start on boot:

    sudo update-rc.d cv defaults 21

### Start Your CV Instance

    sudo service cv start

## Nginx

**Note:** Nginx is the officially supported web server for CV.

### Installation

    sudo apt-get install -y nginx

### Site Configuration

Copy the example site config:

    sudo cp lib/support/nginx/cv /etc/nginx/sites-available/cv
    sudo ln -s /etc/nginx/sites-available/cv /etc/nginx/sites-enabled/cv

Make sure to edit the config file to match your setup:

    sudo editor /etc/nginx/sites-available/cv

### Restart

    sudo service nginx restart


**Enjoy!**
