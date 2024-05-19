echo nameserver 10.65.3.2 > /etc/resolv.conf

apt-get update
apt-get install nginx -y
apt-get install lynx -y
apt-get install php php-fpm -y
apt-get install wget -y
apt-get install unzip -y
service nginx start
service php7.3-fpm start

wget -O '/var/www/harkonen.it03.com' 'https://docs.google.com/uc?export=download&id=1lmnXJUbyx1JDt2OA5z_1dEowxozfkn30'
unzip -o /var/www/harkonen.it03.com -d /var/www/
rm /var/www/harkonen.it03.com
mv /var/www/modul-3 /var/www/harkonen.it03.com