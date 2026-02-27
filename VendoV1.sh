#!/bin/bash
set -e

echo "Starting deployment..."

# 1️⃣ Update system and install dependencies
sudo cp -r web_admin/* /var/www/html/admin/

# # 2️⃣ Deploy web_admin
# echo "Deploying admin site..."
# sudo mkdir -p /var/www/html/admin
# sudo cp -r web_admin/* /var/www/html/admin/
# sudo chown -R www-data:www-data /var/www/html/admin
# sudo chmod -R 755 /var/www/html/admin

# # 3️⃣ Deploy web_user
# echo "Deploying user site..."
# sudo mkdir -p /var/www/html/user
# sudo cp -r web_user/* /var/www/html/user/
# sudo chown -R www-data:www-data /var/www/html/user
# sudo chmod -R 755 /var/www/html/user

# # 4️⃣ Deploy scripts
# echo "Copying utility scripts..."
# sudo mkdir -p /usr/local/bin
# sudo cp -r scripts/* /usr/local/bin/
# sudo chmod +x /usr/local/bin/*

# # 5️⃣ Restart services if needed
# sudo systemctl restart apache2

# echo "Deployment complete!"