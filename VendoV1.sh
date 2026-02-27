#!/bin/bash
set -e



echo "Updating system..."
sudo apt update -y

# Target directory
$Admin_DIR="/var/www/html/admin"

# Create directory if it doesn't exist
sudo mkdir $TARGET_DIR
sudo chown -R www-data:www-data $Admin_DIR

# Download files
curl -L https://github.com/jces227/OrangePi1V1/tree/main/admin/dashboard.php -o $Admin_DIR/dashboard.php
curl -L https://github.com/jces227/OrangePi1V1/tree/main/admin/index.php -o $Admin_DIR/index.php
curl -L https://github.com/jces227/OrangePi1V1/tree/main/admin/logout.php -o $Admin_DIR/logout.php
curl -L https://github.com/jces227/OrangePi1V1/tree/main/admin/style.css -o $Admin_DIR/style.css

echo "Done! Your website is installed."

