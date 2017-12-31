#!/bin/sh

# set up ECCUBE3 enviroment.

# ---------------
# git zip unzip 
# ---------------
sudo yum install git zip unzip -y

# ---------------
# php7.0
# ---------------
sudo yum -y install epel-release
wget http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
sudo rpm -Uvh remi-release-6*.rpm
sudo yum -y install  --enablerepo=remi --enablerepo=remi-php70 php php-devel php-mbstring php-pdo php-gd php-xml php-mcrypt php-mysqlnd php-pgsql php-pecl-zip php-pecl-apcu

# ---------------
# composer
# ---------------
sudo curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

# ---------------
# mysql5.6
# ---------------
sudo yum install -y http://dev.mysql.com/get/mysql-community-release-el6-5.noarch.rpm
sudo yum install -y mysql mysql-devel mysql-server mysql-utilities
sudo /etc/init.d/mysqld start

mysql -u root -e 'CREATE DATABASE eccube_dev DEFAULT CHARACTER SET utf8'
mysql -u root -e "create user 'develop'@'localhost' identified by 'password'"
mysql -u root -e "grant all on eccube_dev.* to 'develop'@'localhost' identified by 'password'"
sudo chkconfig mysqld on 

# ---------------
# postgresql9.6 / postgresqlはひとまずコメントアウト
# ---------------

# sudo yum -y localinstall https://yum.postgresql.org/9.6/redhat/rhel-6.7-x86_64/pgdg-centos96-9.6-3.noarch.rpm
# sudo yum -y install postgresql96-server
# sudo service postgresql-9.6 initdb
# sudo service postgresql-9.6 start
# sudo chkconfig postgresql-9.6 on
# cd /vagrant 
# sudo -u postgres createuser cube3_dev_user
# sudo -u postgres psql -c "ALTER ROLE cube3_dev_user WITH PASSWORD 'password';"
# sudo -u postgres createdb -T template0 -E utf8 cube3_dev 


# ---------------
# language 
# ---------------
sudo sed -i -e 's/xxx/XXX/g' /etc/sysconfig/i18n
sudo sed -i -e '1a LANG="en_US.UTF-8"' /etc/sysconfig/i18n

# ---------------
# stop iptables
# ---------------
sudo service iptables stop
sudo chkconfig iptables off

# ---------------
# disable selinux
# ---------------
sudo sed -i "s/\(^SELINUX=\).*/\1disabled/" /etc/selinux/config

# ---------------
# php.ini
# ---------------
sudo sed -i -e "s|;date.timezone =|date.timezone = Asia/Tokyo|" /etc/php.ini

# ---------------
# httpd.conf
# ---------------
sudo sed -i -e "s|User apache|User vagrant|" /etc/httpd/conf/httpd.conf
sudo sed -i -e "s|Group apache|Group vagrant|" /etc/httpd/conf/httpd.conf

sudo chown vagrant:vagrant /var/lib/php/session
sudo chown vagrant:vagrant /var/lib/php/wsdlcache
sudo chown vagrant:vagrant /var/lib/php/opcache

# ---------------
# https://qiita.com/kurosawa_kuro/items/61676cb91e0e45b87705
# ---------------

