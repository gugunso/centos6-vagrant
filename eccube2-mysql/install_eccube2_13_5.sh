#!/bin/bash

# ---------------
# install_eccube2_enviroment.sh 実行後に。
# ---------------
cd /vagrant
wget -q https://github.com/EC-CUBE/eccube-2_13/archive/eccube-2.13.5.tar.gz
tar -zxf eccube-2.13.5.tar.gz
mv eccube-2_13-eccube-2.13.5 eccube2_13_5
rm eccube-2.13.5.tar.gz

# ---------------
# set document root
# ---------------
sudo sed -i -e 's|DocumentRoot "/var/www/html"|DocumentRoot "/vagrant/eccube2_13_5/html"|' /etc/httpd/conf/httpd.conf
echo "Set DocumentRoot to  /vagrant/eccube2_13_5/html "

 
