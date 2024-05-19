echo nameserver 192.168.122.1 > /etc/resolv.conf

apt-get update
apt-get install apache2-utils php7.3 php-fpm -y
apt-get install nginx -y
apt-get install lynx -y