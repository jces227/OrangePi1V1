#!/bin/bash

echo "LAN Rules..."
sudo curl -L https://raw.githubusercontent.com/jces227/OrangePi1V1/main/10-lan0.rules -o /etc/udev/rules.d/10-lan0.rules
sudo udevadm control --reload

echo "Updating System"
sudo apt update && sudo apt upgrade -y
sudo apt install -y
sudo apt install -y curl
sudo apt install -y wget
sudo apt install -y git
sudo apt install -y nano
sudo apt install -y htop
sudo apt install -y ca-certificates
sudo apt install -y openssl
sudo apt install -y gnupg
sudo apt install -y lsb-release
sudo apt install -y software-properties-common

echo "Installing Ngix"
sudo apt install -y nginx
sudo systemctl enable nginx
sudo systemctl start nginx

sudo apt install -y php-fpm
sudo apt install -y php-cli
sudo apt install -y php-curl
sudo apt install -y php-json
sudo apt install -y php-mbstring
sudo apt install -y php-xml
sudo apt install -y php-zip

pip3 install requests
sudo apt install -y supervisor
sudo apt install -y dphys-swapfile
sudo systemctl enable dphys-swapfile

echo "10-dhcp-all-interfaces.yaml Downloading..."
sudo rm /etc/netplan/10-dhcp-all-interfaces.yaml
sudo curl -L https://raw.githubusercontent.com/jces227/OrangePi1V1/main/10-dhcp-all-interfaces.yaml -o /etc/netplan/10-dhcp-all-interfaces.yaml






#sudo mkdir /var/www/html/admin
#sudo chown -R www-data:www-data /var/www/html/admin

# Download files
#sudo curl -L https://raw.githubusercontent.com/jces227/OrangePi1V1/tree/main/admin/dashboard.php -o /var/www/html/admin/dashboard.php
#sudo curl -L https://raw.githubusercontent.com/jces227/OrangePi1V1/tree/main/admin/index.php -o /var/www/html/admin/index.php
#sudo curl -L https://raw.githubusercontent.com/jces227/OrangePi1V1/tree/main/admin/logout.php -o /var/www/html/admin/logout.php
#sudo curl -L https://raw.githubusercontent.com/jces227/OrangePi1V1/tree/main/admin/style.css -o /var/www/html/admin/style.css

echo "Done! Your website is installed."

