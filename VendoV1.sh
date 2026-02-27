#!/bin/bash
set -e

echo "Updating system..."
sudo apt update -y

echo "Installing Apache & PHP..."
sudo apt install -y apache2 php libapache2-mod-php

echo "Copying website files..."
sudo cp -r web/* /var/www/html/

echo "Setting permissions..."
sudo chown -R www-data:www-data /var/www/html
sudo chmod -R 755 /var/www/html

echo "Restarting Apache..."
sudo systemctl restart apache2

echo "Done! Your website is installed."

