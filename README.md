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
    sudo -u cv -H git clone git@gitlab.bcaron.me:root/b-caron-research-activities.git

### Configure It

    # Go to CV App installation folder
    cd /home/cv/cv

    # Copy the example config
    sudo -u cv -H cp config/config.yml.example config/config.yml

    # Update config file
    sudo -u cv -H editor config/config.yml

### Install Gems

    # Install Gems
    sudo -u cv -H bundle install

### Install Init Script

Download the init script (will be `/etc/init.d/cv`):

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

### Create First User

    # Go to the CV rails app folder
    cd ~cv/cv
    # Open the rails console
    rails console
    # Create your first user
    irb(main):001:0> user=User.create!(:email=>'admin@local.host',:name=>'Admin',:password=>'foobar')
    # Exit the rails console
    irb(main):001:0> exit

**Enjoy!**
