#!/bin/bash

echo "Updating system..."
sudo apt update
sudo apt install apache2 php -y

#sudo mkdir /var/www/html/admin
#sudo chown -R www-data:www-data /var/www/html/admin

# Download files
curl -L https://github.com/jces227/OrangePi1V1/tree/main/10-lan0.rules -o /etc/udev/rules.d/10-lan0.rules
#curl -L https://github.com/jces227/OrangePi1V1/tree/main/admin/index.php -o /var/www/html/admin/index.php
#curl -L https://github.com/jces227/OrangePi1V1/tree/main/admin/logout.php -o /var/www/html/admin/logout.php
#curl -L https://github.com/jces227/OrangePi1V1/tree/main/admin/style.css -o /var/www/html/admin/style.css

echo "Done! Your website is installed."

