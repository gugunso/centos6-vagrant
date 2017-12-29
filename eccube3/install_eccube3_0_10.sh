#!/bin/bash

# ---------------
# eccube3.0.10 instal
# /var/www/vagrant/ec-cube/html 
# ---------------

# ---------------
# ディレクトリ準備
# ---------------
if [ -d /var/www/vagrant ]; then
cd /var/www/vagrant
else
cd /var/www
sudo mkdir vagrant
sudo chown vagrant:vagrant vagrant
cd vagrant
fi

if [ -d /var/www/vagrant/ec-cube ]; then
rm -rf /var/www/vagrant/ec-cube
fi

# ---------------
# ECCUBE 3.0.10 本体インストール
# ---------------
composer create-project ec-cube/ec-cube ec-cube "3.0.10"

# ---------------
# Apache設定変更
# ---------------
sudo sed -i -e 's|DocumentRoot "/var/www/html"|DocumentRoot "/var/www/vagrant/ec-cube/html"|' /etc/httpd/conf/httpd.conf
sudo sed -i -e 's|<Directory "/var/www/html">|<Directory "/var/www/vagrant/ec-cube/html">|' /etc/httpd/conf/httpd.conf
sudo sed -i -e "s/AllowOverride None/AllowOverride All/g" /etc/httpd/conf/httpd.conf

