# Nginx installation
echo "deb http://nginx.org/packages/debian/ stretch nginx" >> /etc/apt/sources.list
echo "deb-src http://nginx.org/packages/debian/ stretch nginx" >> /etc/apt/sources.list
wget https://nginx.org/keys/nginx_signing.key
apt-key add nginx_signing.key
rm -rf nginx_signing.key
apt-get update
apt-get install nginx -y
systemctl enable nginx
systemctl start nginx

# Nginx configuration
mv /etc/nginx/nginx.conf /etc/nginx/nginx_org.conf
wget -O /etc/nginx/nginx.conf https://raw.githubusercontent.com/hidden-refuge/demp-deb9-testing/master/nginx.conf
systemctl restart nginx

# PHP 7.0 installation
apt-get install php7.0 php7.0-bcmath php7.0-bz2 php7.0-cgi php7.0-cli php7.0-common php7.0-curl php7.0-enchant php7.0-fpm php7.0-gd php7.0-json php7.0-mbstring php7.0-mcrypt php7.0-mysql php7.0-opcache php7.0-readline php7.0-soap php7.0-xml php7.0-xmlrpc php7.0-xsl php7.0-zip php-apcu php-geoip -y
systemctl enable php7.0-fpm
systemctl start php7.0-fpm


# PHP 7.0 configuration
rm -rf /etc/php/7.0/fpm/pool.d/www.conf
wget -O /etc/php/7.0/fpm/pool.d/www.conf https://raw.githubusercontent.com/hidden-refuge/demp-deb9-testing/master/www.conf
echo "cgi.fix_pathinfo=0" >> /etc/php/7.0/fpm/php.ini
systemctl restart php7.0-fpm

# MariaDB 10.1 installation
apt-get install mariadb-server -y
systemctl enable mariadb
systemctl start mariadb

# MariaDB configuration
rm -rf /etc/mysql/my.cnf
wget -O /etc/mysql/my.cnf https://raw.githubusercontent.com/hidden-refuge/demp-deb9-testing/master/my.cnf
