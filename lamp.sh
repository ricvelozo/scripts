#!/bin/bash
sudo apt-get install mysql-server apache2 libapache2-mod-php5 php5 php5-mysql phpmyadmin

if [ $(grep --count "/etc/phpmyadmin/apache.conf" \
     "/etc/apache2/apache2.conf") = "0" ]
then
    # Include the configuration of phpMyAdmin for Apache
    echo -e "\n# phpMyAdmin\nInclude /etc/phpmyadmin/apache.conf" \
    | sudo tee -a /etc/apache2/apache2.conf

    # Create `/etc/apache2/conf.d/` directory if it does not exist
    sudo mkdir -p /etc/apache2/conf.d/

    # Create a symbolic link to configuration of phpMyAdmin
    sudo ln -s /etc/phpmyadmin/apache.conf /etc/apache2/conf.d/phpmyadmin.conf

    # Restart the Apache
    sudo service apache2 restart
fi
