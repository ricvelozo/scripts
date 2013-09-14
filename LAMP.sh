#!/bin/bash
sudo apt-get update && sudo apt-get install mysql-server apache2 libapache2-mod-php5 php5 php5-mysql phpmyadmin

if [ $(grep --count "/etc/phpmyadmin/apache.conf" \
      "/etc/apache2/apache2.conf") = "0" ]
then
    # Include the configuration of phpMyAdmin for Apache
    sudo echo -e "\n# phpMyAdmin\nInclude /etc/phpmyadmin/apache.conf" \
    >> /etc/apache2/apache2.conf

    # Create a symbolic link to configuration of phpMyAdmin
    sudo ln -s /etc/phpmyadmin/apache.conf /etc/apache2/conf.d/phpmyadmin.conf

    # Restart the Apache
    sudo service apache2 restart
fi

# Create a symbolic link to /var/www/ in home directory
if [ $(ls ~/ | grep --count "^www$") = "0" ]
    then sudo ln -s /var/www/ ~/www
fi
