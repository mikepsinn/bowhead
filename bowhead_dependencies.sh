#!/usr/bin/env bash

sudo apt-get update
sudo apt-get install -y php7.0 php7.0-opcache php7.0-sqlite3 php7.0-readline php7.0-mysql php7.0-mcrypt php7.0-mbstring php7.0-json php7.0-intl php7.0-gd php7.0-curl php7.0-bz2 php7.0-bcmath php7.0-cli php7.0-zip php7.0-xml
sudo apt-get install -y composer pkg-config php-dompdf php-pear php-imagick autoconf automake libtool m4
sudo apt-get install -y redis-server
sudo apt-get install -y mysql-server
sudo apt-get install -y screen autoconf automake libtool m4 pkg-config
sudo apt-get install -y php-pear unzip python-pip supervisor
sudo apt-get install -y composer pkg-config php-dompdf php-pear php-imagick autoconf automake libtool m4
sudo pecl channel-update pecl.php.net
sudo pecl install trader

#git clone https://github.com/joeldg/bowhead.git
#cd bowhead
composer update
cp .env.example .env
php artisan migrate
php artisan db:seed
echo "* * * * * `which php` `pwd`/artisan schedule:run >> /dev/null 2>&1" | /usr/bin/crontab
mkfifo quotes