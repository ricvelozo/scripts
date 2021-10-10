#!/bin/sh

# Tested on Ubuntu 16.04 LTS “Xenial Xerus”

sudo apt-get install apache2 mysql-server {,libapache2-mod-}php \
php-{bcmath,curl,gd,gettext,imagick,mbstring,mcrypt,mysql,zip} phpmyadmin

# Create a symbolic link to configuration of phpMyAdmin and enable it
sudo ln -s /etc/phpmyadmin/apache.conf \
/etc/apache2/conf-available/phpmyadmin.conf && a2enconf phpmyadmin

# Enable mod_rewrite
sudo a2enmod rewrite

# Restart the Apache service
sudo systemctl restart apache2.service
