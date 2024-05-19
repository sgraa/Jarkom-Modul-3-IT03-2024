mysql -e "CREATE USER 'kelompokit03'@'%' IDENTIFIED BY 'passwordit03';"
mysql -e "CREATE USER 'kelompokit03'@'atreides.it03.com' IDENTIFIED BY 'passwordit03';"
mysql -e "CREATE DATABASE dbkelompokit03;"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'kelompokit03'@'%';"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'kelompokit03'@'atreides.it03.com';"
mysql -e "FLUSH PRIVILEGES;"

mysql="[mysqld]
skip-networking=0
skip-bind-address
"
echo "$mysql" > /etc/mysql/my.cnf

service mysql restart