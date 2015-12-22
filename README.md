# Rails CV App  - A Rails App for a neat-looking, easily customisable Curriculum Vitae

## Screenshot

![CV Demo Screenshot](http://cv-demo.bcaron.me/cv-demo.bcaron.me.png)

## [First of all, try the Demo App !](https://cv-demo.bcaron.me)

# Installation

*Disclaimer: This guide was partly adapted from [Gitlab](https://github.com/gitlabhq/gitlabhq/blob/master/doc/install/installation.md)'s excellent install guide.*

## Prequisites

* This installation guide was created for and tested on Debian/Ubuntu operating systems.
* This is the official installation guide to set up a production server.
* The following steps have been known to work. Please use caution when you deviate from this guide. Make sure you don't violate any assumptions CV App makes about its environment. For example many people run into permission problems because they changed the location of directories or run services as the wrong user.
* If you find a bug/error in this guide please submit an Issue on the Github page of the project.
* The App assumes you will be using an encrypted session (HTTPS). To modify this behaviour, have a look at the section [Using HTTP over HTTPS](#using-http-over-https) of this file.

## Overview

The following components will be set up:

1. Packages / Dependencies
1. Ruby
1. System Users
1. Rails CV App
1. Database
1. Unicorn Server
1. Nginx

If you already have some experience with installing Rails Apps (for instance, `Gitlab`), you'll see it is fairly standard and should take less than 30 minutes.

**Ok, let's get started.**

## 1. Packages / Dependencies

First, update your environment, just to be sure.

    # run as root!
    sudo apt-get update -y
    sudo apt-get upgrade -y
    
**Note:** During this installation some files will need to be edited manually. If you are familiar with vim set it as default editor with the commands below. If you are not familiar with vim please skip this and keep using the default editor.

    # Install vim and set as default editor
    sudo apt-get install -y vim
    sudo update-alternatives --set editor /usr/bin/vim.basic

Install the required packages (needed to compile Ruby and native extensions to Ruby gems):

    sudo apt-get install -y build-essential zlib1g-dev libyaml-dev libssl-dev libgdbm-dev libreadline-dev libncurses5-dev libffi-dev curl openssh-server redis-server checkinstall libxml2-dev libxslt-dev libcurl4-openssl-dev libicu-dev logrotate python-docutils pkg-config cmake libsqlite3-dev

Make sure you have the right version of Git installed

    # Install Git
    sudo apt-get install -y git-core
    
    # Make sure Git is version 1.7.10 or higher, for example 1.7.12 or 2.0.0
    git --version

## 2. Ruby

Remove the old Ruby 1.8 if present

    sudo apt-get remove ruby1.8

Download Ruby and compile it:

    mkdir /tmp/ruby && cd /tmp/ruby
    curl -L --progress ftp://ftp.ruby-lang.org/pub/ruby/2.1/ruby-2.1.2.tar.gz | tar xz
    cd ruby-2.1.2
    ./configure --disable-install-rdoc
    make
    sudo make install

*Note: Downloading and then compiling Ruby is rather long (15 min total).*

Install the Bundler Gem:

    sudo gem install bundler --no-ri --no-rdoc

## 3.System Users

Create a `cv` user for the CV App:

    # Add the cv User
    sudo adduser --disabled-login --gecos 'Rails CV App' cv
    # Add it to the sudo group (he'll need permission to restart services and install gems)
    sudo usermod -aG sudo cv
    # Set its password
    sudo passwd cv
    # Enter Password
    # Enter Password Confirmation

## 4. Rails CV App

 We'll install the CV App into home directory of the user "cv".

    # We'll install the CV App into home directory of the user "cv"
    cd /home/cv

### Clone the Source

    # Clone CV App repository from github
    sudo -u cv -H git clone git@github.com:bertrand-caron/rails-cv-app.git

### Configure It

    # Go to CV App installation folder
    cd /home/cv/rails-cv-app

    # Copy the example config
    sudo -u cv -H cp config/config.yml.example config/config.yml

    # Update config file
    ## The mandatory fields are :
    ### domain-name:
    sudo -u cv -H editor config/config.yml

### Install Gems

Install all the necessary gems system-wide:

    # Install Gems
    sudo bundle install

*Note: If this is the first time deploying Rails App to your server, this step can be rather long (10-15min).*

### Set the secret key

    # Copy the template secrets.yml file
    sudo -u cv -H cp config/secrets.yml.example config/secrets.yml

    # Open the secret file, and enter a valid secret key as explained in the comments
    sudo -u cv -H editor config/secrets.yml

## 5.Database

### Init database and apply migrations

    # Run the necessary database migrations
    sudo -u cv -H RAILS_ENV=production rake db:migrate

### Create First User manually

    # Go to the CV rails app folder
    cd ~cv/rails-cv-app
    # Open the rails console
    sudo -u cv -H RAILS_ENV=production rails console
    # Create your first user
    # 'irb(main):001:0>' is the console prompt
    irb(main):001:0> user=User.create!(:email=>'admin@local.host',:name=>'Admin',:password=>'foobar')
    # Exit the rails console
    irb(main):001:0> exit

### Initialise User Settings

    # Run the rake tasks
    sudo -u cv -H RAILS_ENV=production bundle exec rake settings:init

### Precompile assets

    # Precompile the assets, as needed for production environment
    sudo -u cv -H RAILS_ENV=production bundle exec rake assets:precompile


### Optional: Test the App on `localhost`

**Warning: For this test to work, you'll need to temporarily set `force_ssl = false` in `config/environments/production.rb`. Don't forget to unset it at the end of this paragraph !**

At this point, you should be able to fire the app locally on the computer you installed it on with `sudo -u cv -H RAILS_ENV=production rails server`
ant test it on a web browser **running on the server machine** at `localhost:3000`. Hit 'Ctrl+c' to exit the WEBRick rails server.

**Don't forget to unset it at the end of your local test by running `git checkout --  config/environments/production.rb` ! This is will all the changers made to this file.**

## 6.Unicorn Server

Copy the example config, and modify it if necessary (not necessary if you used the correct user `cv` and install path `~cv/rails-cv-app`).

    # Copy the example config
    sudo -u cv -H cp config/unicorn.rb.example config/unicorn.rb
    # If you are not using the default user ('cv') or directory (/home/cv/rails-cv-app'), you need to modify it
    sudo -u cv -H editor config/unicorn.rb

### Install Init Script

Copy the init script (will be `/etc/init.d/cv`):

    sudo cp lib/support/init.d/cv /etc/init.d/cv

Make CV start on boot:

    sudo update-rc.d cv defaults 21

### Start Your CV Instance

    sudo service cv start

**Note:** If you are running into trouble at this point, Unicorn will most likely ask you to look at the content of `shared/log/unicorn.stderr.log`. Do it and see the content of the file, google your error and post an Issue on the Github tracker if you can't get out of it.

## 7.Nginx

**Note:** Nginx is the officially supported web server for CV.

### Installation

    # Install Nginx    
    sudo apt-get install -y nginx

### Generate SSL certificate

Since the App uses HTTPS by default, you will need a SSL certificate. If you don't already use once for your hosted services, you will need to generate one. SSL Certificate deserve a tutorial on their own (Google is your friend), but for the time being, you can get by temporarily by issuing a self-signed certificate.

To do so, run:

    # First of all, install openssl
    sudo apt-get install openssl

    # Generate a directory for your certs
    sudo mkdir /etc/nginx/certs
    cd /etc/nginx/certs
    
    # Generate the certificate with openssl. 
    sudo openssl req -x509 -newkey rsa:2048 -keyout rails-cv-app_privatekey.pem -out rails-cv-app_server.pem -days 1001 -nodes
    # Answer the questions asked by openssl as accurately as possible.

**Note:** Such a certificate will trigger warnings on modern browsers.

### Site Configuration

Copy the example site config:

    sudo cp lib/support/nginx/cv /etc/nginx/sites-available/cv
    sudo ln -s /etc/nginx/sites-available/cv /etc/nginx/sites-enabled/cv

Make sure to edit the config file to match your setup, especially your domain name:

    # Replace YOUR_SERVER_FQDN with your domain name. Feel free to use subdomains if you want to (for instance cv.jdoe.me), but don't forget to set it properly in config/config.yml too ! 
    sudo editor /etc/nginx/sites-available/cv

**Note:** If you plan on using other SSL certificates that the one showed previously, be sure to update the `ssl_certificate` and `ssl_certificate_key` fields with your own values.

### Restart Nginx

    sudo service nginx restart

At this point, your CV App should be reachable at the domain name you provided.

**Congratulations !**

**Notes:** If you are having problems at this point, look at your nginx access (`less /var/log/nginx/cv_access.log `) and error (`less /var/log/nginx/cv_error.log `) logs for clues.

# Using the Rails CV App

## Use your credentials to sign in and start adding items

Sign in at `your_cv_app_url/signin` using the credentials your generated.

Signing in grants you an additional button in the navbar, `Models`, giving you access to the different sections (Education, Internships, etc.).

## Customise the Settings

There are two sites of settings inside the App : 

* The Global/Developer settings that are located inside the `config/config.yml` YAML file. These are important values (server name, available sections, enabled plugins, etc.) that are not meant to be fiddled with, which are not modifiable in the front-end and that require the app to be restarted (with `sudo service cv restart`) when changed.
* The User Settings that are meant to be highly dynamic (Name, Address, Theme Colors, etc.) that do not need the app to be restarted when they are changed. These are located under the `Settings` tab of the main navbar.

# Extras

## Generate a sitemap

    # Copy the example sitemap config file
    sudo -u cv -H cp config/sitemap.rb.example config/sitemap.rb

    # If you already set up your domain-name correctly in config/config.yml, you have nothing else to do
    # Else, do it now !
    sudo -u cv -H editor config/config.yml

    # Then, add the necessary page to your sitemap in config/sitemap.yml
    sudo -u cv -H editor config/sitemap.yml

    # Finally, refresh the sitemap and ping search engines
    sudo -u cv -H RAILS_ENV=production rake sitemap:refresh

## Using HTTP over HTTPS

The App was written with HTTPS in mind, and as such there is no option (yet?) for switching it off.

The Nginx file provided actually redirects all the unencrypted traffic (HTTP) to HTTPS. If you nevertheless want to bypass this by modifying the Nginx file, you may want to run `egrep -R 'https' app/ lib/ config/` to start looking for hard-coded HTTPS protocol and URLs.

# Updating the Rails CV App

## Philosophy

At this point, the App is fairly new and is evolving rapidly (up to several commits a day lately).
Even if I'm trying to go for sequencial changes, the need for hotfix may be strong and is recommended to
keep up to date with the project.

## Git:pull and git:merge Workflow

### Basic: `git:pull`

Basically, the whole update process is controlled by a single Rake Task invoked with:

    # Update the whole App
    sudo -u cv -H RAILS_ENV=production rake git:pull

What is does is quite trivial and can be found at `lib/tasks/git.rake`:

* Run `git:pull`
* Run `bundle install` (installing new gems)
* Recompile assets
* Restart server (this assume your set up properly the 'service-name:' property in `config/config.yml`)

*Note: Running this command will require two passwords : first, your main user password (to invoke the Rake task as root with `sudo`); and then, the password of the `cv` user we defined at Step 2 (System Users) for running `sudo bundle install` or `sudo service cv restart`.*

### Advanced: `git:merge`

If you have done some non-trivial modifications to the App files that you would like to keep while still receiving the latest code update, you can either run `git stash` to stash your local changed, then run `RAILS_ENV=production rake git:pull` to pull on the clean repository and finally `git stash pop` once the code has been pulled. The other solution is use the `git:merge` rake task like this:

    # Merge the origin/master changes
    sudo -u cv -H RAILS_ENV=production rake git:merge

and then deal with the potential merge conflicts like you would on any other projects.

*Note: Running this command will require two passwords : first, your main user password (to invoke the Rake task as root with `sudo`); and then, the password of the `cv` user we defined at Step 2 (System Users) for running `sudo bundle install` or `sudo service cv restart`.*

**Enjoy!**


