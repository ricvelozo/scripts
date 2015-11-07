#!/bin/bash
sudo apt-get install apache2 libapache2-mod-php5 mysql-server php5 php5-mysql \
php5-mcrypt php5-gd php5-imagick php5-curl phpmyadmin

# Create a symbolic link to configuration of phpMyAdmin
sudo ln -s /etc/phpmyadmin/apache.conf \
/etc/apache2/conf-available/phpmyadmin.conf

# Enable phpMyAdmin
sudo a2enconf phpmyadmin

# Enable mod_rewrite
sudo a2enmod rewrite

# Enable mysql, mcrypt, gd, imagick, and curl
sudo php5enmod mysql mcrypt gd imagick curl

# Restart the Apache
sudo service apache2 restart
