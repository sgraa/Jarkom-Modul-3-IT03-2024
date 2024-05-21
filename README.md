# Praktikum Modul 3 Jaringan Komputer

Praktikum Modul 3 Jaringan Komputer - **IT-03**

## Authors

| Nama                                                | NRP        |
| --------------------------------------------------- | ---------- |
| [Sighra Attariq Sumere Jati](https://www.github.com/sgraa) | 5027221068 |
| [Wilson Matthew Thendry](https://www.github.com/waifuwetdream) | 5027221024 |

### Peta Spice
[Spice Map](https://its.id/m/SpiceMapIT03)


## Daftar isi
- [Topology](#topology)
- [Configuration](#Config)
- [Nomor 1](#nomor-1)
- [Nomor 2](#nomor-2)
- [Nomor 3](#nomor-3)
- [Nomor 4](#nomor-4)
- [Nomor 5](#nomor-5)
- [Nomor 6](#nomor-6)
- [Nomor 7](#nomor-7)
- [Nomor 8](#nomor-8)
- [Nomor 9](#nomor-9)
- [Nomor 10](#nomor-10)
- [Nomor 11](#nomor-11)
- [Nomor 12](#nomor-12)
- [Nomor 13](#nomor-13)
- [Nomor 14](#nomor-14)
- [Nomor 15](#nomor-15)
- [Nomor 16](#nomor-16)
- [Nomor 17](#nomor-17)
- [Nomor 18](#nomor-18)
- [Nomor 19](#nomor-19)
- [Nomor 20](#nomor-20)

# Topology

<div align="center">
    <img src="Images/Topologi.png" alt="Topologi">
</div>  

# Config
- Arrakis (DHCP Relay)
```bash
auto eth0
iface eth0 inet dhcp
up iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE -s 10.65.0.0/16

auto eth1
iface eth1 inet static
address 10.65.1.0
netmask 255.255.255.0

auto eth2
iface eth2 inet static
address 10.65.2.0
netmask 255.255.255.0

auto eth3
iface eth3 inet static
address 10.65.3.0
netmask 255.255.255.0

auto eth4
iface eth4 inet static
address 10.65.4.0
netmask 255.255.255.0
```
- Mohiam (DHCP Server)
```bash
auto eth0
iface eth0 inet static
address 10.65.3.1
netmask 255.255.255.0
gateway 10.65.3.0
```
- Irulan (DNS Server)
```bash
auto eth0
iface eth0 inet static
address 10.65.3.2
netmask 255.255.255.0
gateway 10.65.3.0
```
- Chani (Database Server)
```bash
auto eth0
iface eth0 inet static
address 10.65.4.1
netmask 255.255.255.0
gateway 10.65.4.0
```
- Stilgar (Load Balancer)
```bash
auto eth0
iface eth0 inet static
address 10.65.4.2
netmask 255.255.255.0
gateway 10.65.4.0
```
- Vladimir (PHP Worker)
```bash
auto eth0
iface eth0 inet static
address 10.65.1.2
netmask 255.255.255.0
gateway 10.65.1.0
```
- Rabban (PHP Worker)
```bash
auto eth0
iface eth0 inet static
address 10.65.1.3
netmask 255.255.255.0
gateway 10.65.1.0
```
- Feyd (PHP Worker)
```bash
auto eth0
iface eth0 inet static
address 10.65.1.3
netmask 255.255.255.0
gateway 10.65.1.0
```
- Leto (Laravel Worker)
```bash
auto eth0
iface eth0 inet static
address 10.65.2.2
netmask 255.255.255.0
gateway 10.65.2.0
```
- Duncan (Laravel Worker)
```bash
auto eth0
iface eth0 inet static
address 10.65.2.3
netmask 255.255.255.0
gateway 10.65.2.0
```
- Jessica (Laravel Worker)
```bash
auto eth0
iface eth0 inet static
address 10.65.2.4
netmask 255.255.255.0
gateway 10.65.2.0
```
- Paul (Client)
```bash
auto eth0
iface eth0 inet dhcp
```
- Dmitri (Fixed Client)
```bash
auto eth0
iface eth0 inet dhcp
hwaddress ether 92:6a:4b:8f:b3:cf
```

### Bash Files
- Arrakis (DHCP Relay)
```bash
apt-get update
apt-get install isc-dhcp-relay -y
```
- Mohiam (DHCP Server)
```bash
echo nameserver 192.168.122.1 > /etc/resolv.conf
apt-get update
apt-get install isc-dhcp-server -y
dhcpd --version

echo INTERFACES="eth0" > /etc/default/isc-dhcp-serverm
```
- Irulan (DNS Server)
```bash
echo nameserver 192.168.122.1 > /etc/resolv.conf
apt-get update
apt-get install bind9 -y
```
- Chani (Database Server)
```bash
echo nameserver 192.168.122.1 > /etc/resolv.conf

apt-get update
apt-get install mariadb-server -y
service mysql start
```
- Stilgar (Load Balancer)
```bash
echo nameserver 192.168.122.1 > /etc/resolv.conf

apt-get update
apt-get install apache2-utils php7.3 php-fpm -y
apt-get install nginx -y
apt-get install lynx -y
```
- Vladimir, Rabban, Feyd (PHP Worker)
```bash
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
```
- Leto, Duncan, Jessica (Laravel Worker)
```bash
echo nameserver 192.168.122.1 > /etc/resolv.conf

apt-get update
apt-get install mariadb-client -y
apt-get install lynx -y
apt-get install -y lsb-release ca-certificates apt-transport-https software-properties-common gnupg2
curl -sSLo /usr/share/keyrings/deb.sury.org-php.gpg https://packages.sury.org/php/apt.gpg
sh -c 'echo "deb [signed-by=/usr/share/keyrings/deb.sury.org-php.gpg] https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.li$apt-get update
apt-get install php8.0-mbstring php8.0-xml php8.0-cli php8.0-common php8.0-intl php8.0-opcache php8.0-readline php8.0-mysql php8.0-fpm php8.0-curl $apt-get install nginx -y
wget https://getcomposer.org/download/2.0.13/composer.phar
chmod +x composer.phar
mv composer.phar /usr/bin/composer
apt-get install git -y
git clone https://github.com/martuafernando/laravel-praktikum-jarkom /var/www/laravel-praktikum-jarkom
composer update
composer install
```

# Nomor 1
Ikuti dan bentuk `Peta Spice` sesuai dengan topologi yang telah diberikan.


Buat zone domain di node `Irulan` untuk `atreides.it03.com` yang mengarah ke IP Leto (Laravel Worker) dan juga `harkonen.it03.com` yang mengarah IP Vladimir (PHP Worker).

Gunakan script dibawah ini:

### Irulan.sh
```bash
echo 'zone "atreides.it03.com" {
        type master;
        file "/etc/bind/jarkom/atreides.it03.com";
};

zone "harkonen.it03.com" {
        type master;
        file "/etc/bind/jarkom/harkonen.it03.com";
};' > /etc/bind/named.conf.local

mkdir /etc/bind/jarkom

echo ';
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     atreides.it03.com. root.atreides.it03.com. (
                        2024051601      ; Serial
                        604800          ; Refresh
                        86400           ; Retry
                        2419200         ; Expire
                        604800 )        ; Negative Cache TTL
;
@               IN      NS      atreides.it03.com.
@               IN      A       10.65.2.2 ; IP Leto Laravel Workerr' > /etc/bind/jarkom/atreides.it03.com

echo ';
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     harkonen.it03.com.  harkonen.it03.com.  (
                        2024051601      ; Serial
                        604800          ; Refresh
                        86400           ; Retry
                        2419200         ; Expire
                        604800 )        ; Negative Cache TTL
;
@               IN      NS      harkonen.it03.com.
@               IN      A       10.65.1.2 ; IP Vladimir PHP Worker' > /etc/bind/jarkom/harkonen.it03.com

echo 'options {
        directory "/var/cache/bind";

        forwarders {
                192.168.122.1;
        };

        // dnssec-validation auto;
        allow-query{any;};
        auth-nxdomain no;    # conform to RFC1035
        listen-on-v6 { any; };
}; ' >/etc/bind/named.conf.options

service bind9 restart
```
### Bentuk Hasil Nomor 1
<div align="center">
<img src = Images/no1_1.png Alt = Screenshot1 style = "margin-bottom:15px">
<img src = Images/no1_2.png Alt = Screenshot2 style = "margin-bottom:15px">
</div>

# Nomor 2
Semua CLIENT harus menggunakan konfigurasi dari DHCP Server. 

Client yang melalui **House Harkonen** mendapat range IP dari [prefix IP].1.14 - [prefix IP].1.28 dan [prefix IP].1.49 - [prefix IP].1.70.

Jalankan script dibawah ini untuk menjadikan `Arrakis` sebagai `DHCP Relay`

### Arrakis.sh
```bash
apt-get update
apt-get install isc-dhcp-relay -y
service isc-dhcp-relay start

relay="SERVERS=\"10.65.3.1\" 
INTERFACES=\"eth1 eth2 eth3 eth4\"
OPTIONS=\"\"
"
echo "$relay" > /etc/default/isc-dhcp-relay

echo net.ipv4.ip_forward=1 > /etc/sysctl.conf

service isc-dhcp-relay restart
```
Setelah menjalankan script diatas, tambahkan script di `Mohiam` sebagai `DHCP Server` (untuk bagian nomor 2)

### Mohiam.sh
```bash
subnet 10.65.1.0 netmask 255.255.255.0 {
    range 10.65.1.14 10.65.1.28;
    range 10.65.1.49 10.65.1.70;
    option routers 10.65.1.0;
    option broadcast-address 10.65.1.255;
    default-lease-time 300;
    max-lease-time 5220;
}
```

# Nomor 3
Client yang melalui **House Atreides** mendapatkan range IP dari [prefix IP].2.15 - [prefix IP].2.25 dan [prefix IP].2 .200 - [prefix IP].2.210.

Tambahkan script ke dalam `Mohiam` agar client dari **House Atreides** mendapatkan IPnya.

### Mohiam.sh
```bash
subnet 10.65.2.0 netmask 255.255.255.0 {
    range 10.65.2.15 10.65.2.25;
    range 10.65.2.200 10.65.2.210;
    option routers 10.65.2.0;
    option broadcast-address 10.65.2.255;
    default-lease-time 1200;
    max-lease-time 5220;
}
```

# Nomor 4
Ubah script yang sudah ada di dalam `Mohiam` agar client dapat diarahkan ke IP DNS Server `Irulan`.

### Mohiam.sh
```bash
subnet 10.65.1.0 netmask 255.255.255.0 {
    range 10.65.1.14 10.65.1.28;
    range 10.65.1.49 10.65.1.70;
    option routers 10.65.1.0;
    option broadcast-address 10.65.1.255;
    option domain-name-servers 10.65.3.2; #Gunakan IP Irulan
}

subnet 10.65.2.0 netmask 255.255.255.0 {
    range 10.65.2.15 10.65.2.25;
    range 10.65.2.200 10.65.2.210;
    option routers 10.65.2.0;
    option broadcast-address 10.65.2.255;
    option domain-name-servers 10.65.3.2; #IP Irulan
}
```

Tambahkan juga script dibawah ini ke **Princess Irulan** yang akan membantu client `Dmitri` dan `Paul` agar dapat terhubung ke internet. 

### Irulan.sh
```bash
echo 'options {
        directory "/var/cache/bind";

        forwarders {
                192.168.122.1;
        };

        // dnssec-validation auto;
        allow-query{any;};
        auth-nxdomain no;    # conform to RFC1035
        listen-on-v6 { any; };
}; ' >/etc/bind/named.conf.options
```

Coba ping `google.com` atau `harkonen.it03.com` dan `atreides.it03.com`.

# Nomor 5
Durasi DHCP server meminjamkan alamat IP kepada Client yang melalui **House Harkonen** selama 5 menit sedangkan pada client yang melalui **House Atreides** selama 20 menit. Dengan waktu maksimal dialokasikan untuk peminjaman alamat IP selama 87 menit.

Tambahkan script dibawah ini ke dalam `Mohiam` untuk mengatur waktu peminjaman IP dari server ke client.

### Mohiam.sh
```bash
subnet 10.65.1.0 netmask 255.255.255.0 {
    range 10.65.1.14 10.65.1.28;
    range 10.65.1.49 10.65.1.70;
    option routers 10.65.1.0;
    option broadcast-address 10.65.1.255;
    option domain-name-servers 10.65.3.2;
    default-lease-time 300; #5 Menit Peminjman
    max-lease-time 5220; #Waktu Maksimal 87 Menit
}

subnet 10.65.2.0 netmask 255.255.255.0 {
    range 10.65.2.15 10.65.2.25;
    range 10.65.2.200 10.65.2.210;
    option routers 10.65.2.0;
    option broadcast-address 10.65.2.255;
    option domain-name-servers 10.65.3.2;
    default-lease-time 1200; #20 Menit Peminjaman
    max-lease-time 5220; #Waktu Maksimal 87 Menit
}
```

### Bentuk Hasil No 2-5
<div align="center">
<img src = Images/no5_1.png Alt = Dmitri style = "margin-bottom:15px">
<img src = Images/no5_2.png Alt = Dmitri style = "margin-bottom:15px"> 
</div>

# Nomor 6
**Vladimir Harkonen** memerintahkan setiap worker(harkonen) PHP, untuk melakukan konfigurasi virtual host untuk website dengan menggunakan php 7.3.

Tambahkan script dibawah ini ke dalam `/root/.bashrc`

### Vladimir.sh
```bash
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
```

Buat juga script berikut untuk dijalankan setelah node `Vladimir` dinyalakan.

### Vlad.sh
```bash
cp /etc/nginx/sites-available/default /etc/nginx/sites-available/harkonen.it03.com
ln -s /etc/nginx/sites-available/harkonen.it03.com /etc/nginx/sites-enabled/
rm /etc/nginx/sites-enabled/default

echo 'server {
     listen 80;
     server_name _;

     root /var/www/harkonen.it03.com;
     index index.php index.html index.htm;

     location / {
         try_files $uri $uri/ /index.php?$query_string;
     }

     location ~ \.php$ {
         include snippets/fastcgi-php.conf;
         fastcgi_pass unix:/run/php/php7.3-fpm.sock;
         fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
         include fastcgi_params;
     }
 }' > /etc/nginx/sites-available/harkonen.it03.com

 service nginx restart
```

Lakukan hal yang sama untuk seluruh PHP Worker **Rabban** dan **Feyd**. Gunakan `lynx localhost` di node **Vladimir** ataupun node PHP Worker yang lain sesuai dengan tempat dijalankannya script untuk mengetes apakah konfigurasi web sudah berjalan dengan baik.

### Bentuk Hasil No 6
<div align="center">
<img src = Images/no6.png Alt = Vladimir style = "margin-bottom:15px">
</div>

# Nomor 7
Aturlah agar **Stilgar** dari **Fremen** dapat dapat bekerja sama dengan maksimal, lalu lakukan testing dengan `5000 request` dan `150 request/second`.

Lakukan perubahan pada konfigurasi scrip dalam node **Irulan** agar DNS Server dapat diarahkan ke load balancer

### Irulan-lb.sh
```bash
echo 'zone "atreides.it03.com" {
        type master;
        file "/etc/bind/jarkom/atreides.it03.com";
};

zone "harkonen.it03.com" {
        type master;
        file "/etc/bind/jarkom/harkonen.it03.com";
};' > /etc/bind/named.conf.local

mkdir /etc/bind/jarkom

echo ';
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     atreides.it03.com. root.atreides.it03.com. (
                        2024051601      ; Serial
                        604800          ; Refresh
                        86400           ; Retry
                        2419200         ; Expire
                        604800 )        ; Negative Cache TTL
;
@               IN      NS      atreides.it03.com.
@               IN      A       10.65.4.2 ; IP Stilgar' > /etc/bind/jarkom/atreides.it03.com

echo ';
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     harkonen.it03.com.  harkonen.it03.com.  (
                        2024051601      ; Serial
                        604800          ; Refresh
                        86400           ; Retry
                        2419200         ; Expire
                        604800 )        ; Negative Cache TTL
;
@               IN      NS      harkonen.it03.com.
@               IN      A       10.65.4.2 ; IP Stilgar' > /etc/bind/jarkom/harkonen.it03.com

echo 'options {
        directory "/var/cache/bind";

        forwarders {
                192.168.122.1;
        };

        // dnssec-validation auto;
        allow-query{any;};
        auth-nxdomain no;    # conform to RFC1035
        listen-on-v6 { any; };
}; ' >/etc/bind/named.conf.options

service bind9 restart
```
`@               IN      A       10.65.4.2 ; IP Stilgar` disini pastikan untuk menggunakan IP Stilgar agar menuju ke load balancer.

Lalu tambahkan script berikut ke dalam **Stilgar** agar algoritma load balancer dapat dijalankan
```bash
cp /etc/nginx/sites-available/default /etc/nginx/sites-available/lb_php

mkdir /etc/nginx/supersecret
htpasswd -c -b /etc/nginx/supersecret/.htpasswd secmart kcksit03


echo '
    upstream worker { # (ip_hash, least_conn, hash $request_uri consistent)
    #hash $request_uri consistent;
    #least_conn;
    #ip_hash;
    server 10.65.1.2;
    server 10.65.1.3;
    server 10.65.1.4;
}

 server {
        listen 80;
        root /var/www/html;
        index index.html index.htm index.nginx-debian.html;

        server_name _;

        location / {
                allow 10.65.1.37;
                allow 10.65.1.67;
                allow 10.65.2.203;
                allow 10.65.2.207;
                deny all;
                proxy_pass http://worker;
                auth_basic "Restricted Access";
                auth_basic_user_file /etc/nginx/supersecret/.htpasswd;
        }

        location /dune {
                proxy_pass https://www.dunemovie.com.au/;
                proxy_set_header Host www.dunemovie.com.au;
                proxy_set_header X-Real-IP $remote_addr;
                proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
                proxy_set_header X-Forwarded-Proto $scheme;
        }
} ' > /etc/nginx/sites-available/lb_php

ln -sf /etc/nginx/sites-available/lb_php /etc/nginx/sites-enabled/

if [ -f /etc/nginx/sites-enabled/default ]; then
    rm /etc/nginx/sites-enabled/default
fi

service nginx restart
```
Buka node client **Dmitri**, untuk melakukan pengetesan jalankan command ini: `ab -n 5000 -c 150 http://harkonen.it03.com`

### Bentuk Hasil No 7
<div align="center">
<img src = Images/no7.png Alt = "DmitriNo7"  style="bottom-margin:15px">
</div>

# Nomor 8 
Karena diminta untuk menuliskan peta tercepat menuju spice, buatlah analisis hasil testing dengan 500 request dan 50 request/second masing-masing algoritma Load Balancer dengan ketentuan sebagai berikut:
```
1. Nama Algoritma Load Balancer
2. Report hasil testing pada Apache Benchmark
3. Grafik RPS untuk masing masing algoritma
4. Analisis
```
Gunakan script yang telah dibuat pada nomor 7 dengan sedikit tambahan dalam script `vlad.sh`

#### Round Robin
```bash
    upstream worker { #Round-robin digunakan secara default
    server 10.65.1.2;
    server 10.65.1.3;
    server 10.65.1.4;
}
```
#### IP Hash
```bash
    upstream worker { 
    ip_hash;
    server 10.65.1.2;
    server 10.65.1.3;
    server 10.65.1.4;
}
```

#### Generic Hash
```bash
    upstream worker { 
    hash $request_uri consistent;
    server 10.65.1.2;
    server 10.65.1.3;
    server 10.65.1.4;
}
```

#### Least Connection
```bash
    upstream worker {
    least_conn;
    server 10.65.1.2;
    server 10.65.1.3;
    server 10.65.1.4;
}
```
Berikut script utuhnya dalam node **Stilgar**
### Stilgar.sh
```bash
service nginx start

cp /etc/nginx/sites-available/default /etc/nginx/sites-available/lb_php

mkdir /etc/nginx/supersecret
htpasswd -c -b /etc/nginx/supersecret/.htpasswd secmart kcksit03


echo '
    upstream worker { # (ip_hash, least_conn, hash $request_uri consistent)
    #hash $request_uri consistent;
    #least_conn;
    #ip_hash;
    server 10.65.1.2;
    server 10.65.1.3;
    server 10.65.1.4;
}

 server {
        listen 80;
        root /var/www/html;
        index index.html index.htm index.nginx-debian.html;

        server_name _;

        location / {
                allow 10.65.1.37;
                allow 10.65.1.67;
                allow 10.65.2.203;
                allow 10.65.2.207;
                deny all;
                proxy_pass http://worker;
                auth_basic "Restricted Access";
                auth_basic_user_file /etc/nginx/supersecret/.htpasswd;
        }

        location /dune {
                proxy_pass https://www.dunemovie.com.au/;
                proxy_set_header Host www.dunemovie.com.au;
                proxy_set_header X-Real-IP $remote_addr;
                proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
                proxy_set_header X-Forwarded-Proto $scheme;
        }
} ' > /etc/nginx/sites-available/lb_php

ln -sf /etc/nginx/sites-available/lb_php /etc/nginx/sites-enabled/

if [ -f /etc/nginx/sites-enabled/default ]; then
    rm /etc/nginx/sites-enabled/default
fi

service nginx restart
```
Untuk menjalankan masing-masing algoritm, comment dan un-comment sesuai dengan algoritma load balancer yang ingin digunakan.

Kemudian untuk menguji masing-masing algoritma load balancer gunakan command berikut ini: `ab -n 500 -c 50 http://harkonen.it03.com/`

### Bentuk Hasil No 8

#### Round Robin
<div align="center">
<img src = Images/no8_round-robin.png style ="margin-bottom:15px">
<img src = Images/no8_htop-round-robin.png style ="margin-bottom:15px">
</div>

#### IP Hash
<div align="center">
<img src = Images/no8_ip-hash.png style ="margin-bottom:15px">
<img src = Images/no8_htop-ip-hash.png style ="margin-bottom:15px">
</div>

#### Generic Hash
<div align="center">
<img src = Images/no8_generic-hash.png style ="margin-bottom:15px">
<img src = Images/no8_htop-generic-hash.png style ="margin-bottom:15px">
</div>

#### Least Connection
<div align="center">
<img src = Images/no8_least_conn.png style ="margin-bottom:15px">
<img src = Images/no8_htop-least-conn.png style ="margin-bottom:15px">
</div>

### Grafik
<div align="center">
<img src = Images/no8_grafik.png style ="margin-bottom:15px">
</div>

**RPS (request per second)** atau jumlah request yang dapat dihandle dalam setiap detik, berarti semakin tinggi nilai RPS maka cenderung lebih baik. Berdasarkan data hasil testing didapatkan nilai RPS tertinggi pada **Round Robin** yaitu `914 rps`.

# Nomor 9
Dengan menggunakan algoritma Least-Connection, lakukan testing dengan menggunakan 3 worker, 2 worker, dan 1 worker sebanyak 1000 request dengan 10 request/second, kemudian tambahkan grafiknya pada peta.

Gunakanlah script yang sama dengan [Nomor 7](#nomor-7) dan un-comment sesuai dengan jumlah worker yang ingin digunakan.

#### 3 Worker
```bash
    upstream worker { 
    least_conn;
    server 10.65.1.2;
    server 10.65.1.3;
    server 10.65.1.4;
}
```

#### 2 Worker
```bash
    upstream worker { 
    least_conn;
    server 10.65.1.2;
    server 10.65.1.3;
}
```

#### 1 Worker
```bash
    upstream worker { 
    least_conn;
    server 10.65.1.2;
}
```
Lalu untuk pengetesan gunakan command ini: `ab -n 1000 -c 10 http://harkonen.it03.com/`

### Bentuk Hasil No 9

#### 3 Worker
<div align="center">
<img src = Images/no9_3worker.png style ="margin-bottom:15px">
<img src = Images/no9_htop-3worker.png style ="margin-bottom:15px">
</div>

#### 2 Worker
<div align="center">
<img src = Images/no9_2worker.png style ="margin-bottom:15px">
<img src = Images/no9_htop-2worker.png style ="margin-bottom:15px">
</div>

#### 1 Worker
<div align="center">
<img src = Images/no9_1worker.png style ="margin-bottom:15px">
<img src = Images/no9_htop-1worker.png style ="margin-bottom:15px">
</div>

### Grafik
<div align="center">
<img src = Images/no9_grafik.png style ="margin-bottom:15px">
</div>

Berdasarkan data hasil testing didapat RPS tertinggi pada penggunaan **1 worker**.

# Nomor 10
Selanjutnya coba tambahkan keamanan dengan konfigurasi autentikasi di LB dengan dengan kombinasi username: **“secmart”** dan password: **“kcksyyy”**, dengan yyy merupakan kode kelompok. Terakhir simpan file **“htpasswd”** nya di `/etc/nginx/supersecret/`

Tambahkan bagian script berikut ke dalam node **Stilgar** untuk membuat folder dan juga menambahkan password ke dalamnya:

```bash
mkdir /etc/nginx/supersecret
htpasswd -c -b /etc/nginx/supersecret/.htpasswd secmart kcksyyy 
#Ganti kcksyyy dengan nomor kelompok
```

Setelah menambahkan code diatas ke dalam `stilgar.sh`, kita dapat melakukan pengujian dengan menjalankan `lynx http://harkonen.it03.com` pada client **Dmitri** untuk melakukan autentikasi.

### Bentuk Hasil No 10
<div align="center">
<img src = Images/no10_1.png style ="margin-bottom:15px">
<img src = Images/no10_2.png style ="margin-bottom:15px">
<img src = Images/no10_3.png style ="margin-bottom:15px">
</div>

# Nomor 11
Lalu buat untuk setiap request yang mengandung `/dune` akan di proxy passing menuju halaman https://www.dunemovie.com.au/.

Tambahkan script dibawah ini ke dalam `stilgar.sh` agar dapat terhubung ke website dune.
```bash
        location /dune {
                proxy_pass https://www.dunemovie.com.au/;
                proxy_set_header Host www.dunemovie.com.au;
                proxy_set_header X-Real-IP $remote_addr;
                proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
                proxy_set_header X-Forwarded-Proto $scheme;
                auth_basic "Restricted Access";
                auth_basic_user_file /etc/nginx/supersecret/.htpasswd;
        }
```

Lakukan pengetesan dengan menjalankan `lynx http://harkonen.it03.com/dune` pada client **Dmitri**.

### Bentuk Hasil No 11
<div align="center">
<img src = Images/no11.png style ="margin-bottom:15px">
</div>

# Nomor 12
Selanjutnya LB ini hanya boleh diakses oleh client dengan IP [Prefix IP].1.37, [Prefix IP].1.67, [Prefix IP].2.203, dan [Prefix IP].2.207.

Tambahkan script dibawah ini ke dalam `stilgar.sh` untuk hanya memberikan akses kepada IP yang ditentukan:
```bash
    location / {
        allow 10.65.1.37;
        allow 10.65.1.67;
        allow 10.65.2.203;
        allow 10.65.2.207;
        deny all;
    }
```

Tentukan client yang akan dijadikan sebagai **fixed client**. Tambahkan script berikut ke dalam **DHCP Server Mohiam**
```bash
    host Dmitri {
        hardware ethernet 92:6a:4b:8f:b3:cf;
        fixed-address 10.65.1.67;
    }
```

- `92:6a:4b:8f:b3:cf` Diperoleh dengan menjalankan `ip a` pada client **Dmitri** yang kemudian diambil dengan bagian yang terhubung ke **DHCP Relay Arrakis** yaitu `eth0`.
- `10.65.1.67` Diperoleh dengan menentukan ip yang sudah ada di soal sebagai ip tetap dari client **Dmitri** ke dalam network confignya.

#### Konfigurasi IP Tetap Client Dmitri
<div align="center">
<img src = Images/no12_1.png style ="margin-bottom:15px">
</div>

Kemudian untuk pengetesan, jalankan perintah `lynx http://harkonen.it03.com` pada node **Dmitri** dan node **Paul**. Dimana seharusnya **Paul** tidak akan mampu untuk mengakses web tersebut.

### Bentuk Hasil No 12
<div align="center">
<img src = Images/no12_2.png style ="margin-bottom:15px">
</div>

# Nomor 13
Semua data yang diperlukan, diatur pada Denken dan harus dapat diakses oleh Frieren, Flamme, dan Fern.

Tambahkan script dibawah ini ke dalam **Database Server Chani** untuk membuat database baru:

### Chani.sh
```bash
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
```

Lalu pada laravel workers **Leto, Duncan, dan Jessica**, jalankan command dibawah ini untuk menguji dan memastikan bahwa seluruh laravel worker dapat mengakses databasre milik **Chani**.
```bash
mariadb --host=10.65.4.1 --port=3306 --user=kelompokit03 --password=
```

### Bentuk Hasil No 13
<div align="center">
<img src = Images/no13.png style ="margin-bottom:15px">
</div>

# Nomor 14
**Leto, Duncan, dan Jessica** memiliki **Atreides** Channel sesuai dengan quest guide berikut. Jangan lupa melakukan instalasi PHP8.0 dan Composer.

Tambahkan dan jalankan script dibawah ini untuk melakukan instalasi pada laravel worker:
```bash
cd /var/www/laravel-praktikum-jarkom && composer update
composer install

cp /var/www/laravel-praktikum-jarkom/.env.example /var/www/laravel-praktikum-jarkom/.env

echo 'APP_NAME=Laravel
APP_ENV=local
APP_KEY=
APP_DEBUG=true
APP_URL=http://localhost

LOG_CHANNEL=stack
LOG_DEPRECATIONS_CHANNEL=null
LOG_LEVEL=debug

DB_CONNECTION=mysql
DB_HOST=10.65.4.1
DB_PORT=3306
DB_DATABASE=dbkelompokit03
DB_USERNAME=kelompokit03
DB_PASSWORD=passwordit03

BROADCAST_DRIVER=log
CACHE_DRIVER=file
FILESYSTEM_DISK=local
QUEUE_CONNECTION=sync
SESSION_DRIVER=file
SESSION_LIFETIME=120

MEMCACHED_HOST=127.0.0.1

REDIS_HOST=127.0.0.1
REDIS_PASSWORD=null
REDIS_PORT=6379

MAIL_MAILER=smtp
MAIL_HOST=mailpit
MAIL_PORT=1025
MAIL_USERNAME=null
MAIL_PASSWORD=null
MAIL_ENCRYPTION=null
MAIL_FROM_ADDRESS="hello@example.com"
MAIL_FROM_NAME="${APP_NAME}"

AWS_ACCESS_KEY_ID=
AWS_SECRET_ACCESS_KEY=
AWS_DEFAULT_REGION=us-east-1
AWS_BUCKET=
AWS_USE_PATH_STYLE_ENDPOINT=false

PUSHER_APP_ID=
PUSHER_APP_KEY=
PUSHER_APP_SECRET=
PUSHER_HOST=
PUSHER_PORT=443
PUSHER_SCHEME=https
PUSHER_APP_CLUSTER=mt1

VITE_PUSHER_APP_KEY="${PUSHER_APP_KEY}"
VITE_PUSHER_HOST="${PUSHER_HOST}"
VITE_PUSHER_PORT="${PUSHER_PORT}"
VITE_PUSHER_SCHEME="${PUSHER_SCHEME}"
VITE_PUSHER_APP_CLUSTER="${PUSHER_APP_CLUSTER}"
' > /var/www/laravel-praktikum-jarkom/.env

service nginx start
cd /var/www/laravel-praktikum-jarkom
composer update
composer install
service nginx start
php artisan migrate:fresh
php artisan db:seed --class=AiringsTableSeeder
php artisan key:generate
php artisan config:cache
php artisan migrate
php artisan db:seed
php artisan storage:link
php artisan jwt:secret
php artisan config:clear
chown -R www-data.www-data /var/www/laravel-praktikum-jarkom/storage
```

Jika script berhasil dijalankan, maka dalam database akan memberikan hasil sebagai berikut:
<div align="center">
<img src = Images/no14_1.png style ="margin-bottom:15px">
</div>

Kemudian jika sudah sukses, maka deployment dapat dilakukan. Dalam soal ini, kelompok kami menggunakan pembagian port sebagai berikut:
```
Leto    : 8001
Duncan  : 8002
Jessica : 8003
```

Tambahkan command dibawah ini ke dalam script `leto.sh` untuk melakukan deployment.
```bash
echo 'server {

    listen 8001;

    root /var/www/laravel-praktikum-jarkom/public;

    index index.php index.html index.htm;
    server_name _;

    location / {
            try_files $uri $uri/ /index.php?$query_string;
    }

    location ~ \.php$ {
    include snippets/fastcgi-php.conf;
    fastcgi_pass unix:/var/run/php/php8.0-fpm.sock;
    }

location ~ /\.ht {
            deny all;
    }

    error_log /var/log/nginx/fff_error.log;
    access_log /var/log/nginx/fff_access.log;
}
' > /etc/nginx/sites-available/fff

ln -s /etc/nginx/sites-available/fff /etc/nginx/sites-enabled/
chown -R www-data.www-data /var/www/laravel-praktikum-jarkom/storage
service php8.0-fpm start
service nginx restart
```
Untuk pengetesan, jalankan command `lynx localhost:[port]` dimana port menyesuaikan dengan worker yang sudah ditentukan.

### Bentuk Hasil No 14
<div align="center">
<img src = Images/no14_2.png style ="margin-bottom:15px">
</div>

# Nomor 15
Atreides Channel memiliki beberapa endpoint yang harus ditesting sebanyak **100 request** dengan **10 request/second**. Tambahkan response dan hasil testing pada peta.

**POST /auth/register**

Buat file`register.json` di client **Dmitri** yang berisi:
```bash
{
"username" : "kelompokit03",
"password" : "kelompokit03"
}
```

Untuk pengetesan, gunakan command berikut di terminal:
```bash
ab -n 100 -c 10 -p register.json -T application/json http://10.65.2.2:8001/api/auth/register
```

### Bentuk Hasil No 15
<div align="center">
<img src = Images/no15.png style ="margin-bottom:15px">
</div>

# Nomor 16
**POST /auth/login**

Buat file `login.json` di client **Dmitri** yang berisi:
```bash
{
"username" : "kelompokit03",
"password" : "kelompokit03"
}
```

Untuk pengetesan, gunakan command berikut di terminal:
```bash
ab -n 100 -c 10 -p login.json -T application/json http://10.65.2.2:8001/api/auth/login
```

### Bentuk Hasil No 16
<div align="center">
<img src = Images/no16.png style ="margin-bottom:15px">
</div>

# Nomor 17
**GET /me**

Buat script `getme.sh` dengan isi sebagai berikut:
```bash
curl -X POST -H "Content-Type: application/json" -d @login.json http://10.65.2.2:8001/api/auth/login > login_output.txt
token=$(cat login_output.txt | jq -r '.token')
```

Script diatas digunakan untuk mendapatkan bearer token yang akan digunakan dalam script pengetesan sebagai berikut:
```bash
ab -n 100 -c 10 -H "Authorization: Bearer $token" http://10.65.2.2:8001/api/me
```

### Bentuk Hasil No 17
<div align="center">
<img src = Images/no17.png style ="margin-bottom:15px">
</div>

# Nomor 18
Ubah konfigurasi pada node `stilgar.sh` dan tambahkan script dibawah ini:
```bash
echo 'upstream pekerja { #(round-robin(default), ip_hash, least_conn, hash $request_uri consistent)
    least_conn;
    server 10.65.2.2:8001;
    server 10.65.2.3:8002;
    server 10.65.2.4:8003;
}

server {
    listen 80;
    server_name atreides.it03.com;

    location / {
        proxy_pass http://pekerja;
    }
}
' > /etc/nginx/sites-available/laravel-fff

ln -s /etc/nginx/sites-available/laravel-fff /etc/nginx/sites-enabled/
```

Untuk pengetesan, jalankan script berikut
```bash
ab -n 100 -c 10 -p login.json -T application/json http://atreides.it03.com/api/auth/login
```

### Bentuk Hasil No 18
#### Duncan
<div align="center">
<img src = Images/no18_1.png style ="margin-bottom:15px">
</div>

#### Leto
<div align="center">
<img src = Images/no18_2.png style ="margin-bottom:15px">
</div>

#### Jessica
<div align="center">
<img src = Images/no18_3.png style ="margin-bottom:15px">
</div>

# Nomor 19
Untuk meningkatkan performa dari Worker, coba implementasikan PHP-FPM pada Leto, Duncan, dan Jessica. Untuk testing kinerja naikkan 
- pm.max_children
- pm.start_servers
- pm.min_spare_servers
- pm.max_spare_servers
sebanyak tiga percobaan dan lakukan testing sebanyak 100 request dengan 10 request/second kemudian berikan hasil analisisnya pada PDF.

Buatlah 3 script sebagai berikut:

`testing1.sh`
```bash
echo '[www]
user = www-data
group = www-data
listen = /run/php/php8.0-fpm.sock
listen.owner = www-data
listen.group = www-data
php_admin_value[disable_functions] = exec,passthru,shell_exec,system
php_admin_flag[allow_url_fopen] = off

; Choose how the process manager will control the number of child processes.

pm = dynamic
pm.max_children = 10
pm.start_servers = 5
pm.min_spare_servers = 3
pm.max_spare_servers = 8' > /etc/php/8.0/fpm/pool.d/www.conf

service php8.0-fpm restart
```

`testing2.sh`
```bash
echo '[www]
user = www-data
group = www-data
listen = /run/php/php8.0-fpm.sock
listen.owner = www-data
listen.group = www-data
php_admin_value[disable_functions] = exec,passthru,shell_exec,system
php_admin_flag[allow_url_fopen] = off

; Choose how the process manager will control the number of child processes.

pm = dynamic
pm.max_children = 20
pm.start_servers = 8
pm.min_spare_servers = 5
pm.max_spare_servers = 12' > /etc/php/8.0/fpm/pool.d/www.conf

service php8.0-fpm restart
```

`testing3.sh`
```bash
echo '[www]
user = www-data
group = www-data
listen = /run/php/php8.0-fpm.sock
listen.owner = www-data
listen.group = www-data
php_admin_value[disable_functions] = exec,passthru,shell_exec,system
php_admin_flag[allow_url_fopen] = off

; Choose how the process manager will control the number of child processes.

pm = dynamic
pm.max_children = 40
pm.start_servers = 10
pm.min_spare_servers = 8
pm.max_spare_servers = 15' > /etc/php/8.0/fpm/pool.d/www.conf

service php8.0-fpm restart
```
Untuk pengetesan, jalankan command ini di terminal client **Dmitri**
```bash
ab -n 100 -c 10 -p login.json -T application/json http://10.65.2.2:8001/api/auth/login
```

### Bentuk Hasil No 19
#### testing1.sh
<div align="center">
<img src = Images/no19_1.png style ="margin-bottom:15px">
</div>

#### testing2.sh
<div align="center">
<img src = Images/no19_2.png style ="margin-bottom:15px">
</div>

#### testing3.sh
<div align="center">
<img src = Images/no19_3.png style ="margin-bottom:15px">
</div>

# Nomor 20
Nampaknya hanya menggunakan PHP-FPM tidak cukup untuk meningkatkan performa dari worker maka implementasikan Least-Conn pada Stilgar. Untuk testing kinerja dari worker tersebut dilakukan sebanyak `100 request` dengan `10 request/second`.

Tambahkan script dibawah ini ke dalam script `stilgar.sh` di node **Stilgar**
```bash
echo 'upstream pekerja { #(round-robin(default), ip_hash, least_conn, hash $request_uri consistent)
    least_conn;
    server 10.65.2.2:8001;
    server 10.65.2.3:8002;
    server 10.65.2.4:8003;
}

server {
    listen 80;
    server_name atreides.it03.com;

    location / {
        proxy_pass http://pekerja;
    }
}
' > /etc/nginx/sites-available/laravel-fff

ln -s /etc/nginx/sites-available/laravel-fff /etc/nginx/sites-enabled/
service nginx restart
```

Jalankan command berikut untuk melakukan pengetesan di client **Dmitri** terhadap script yang baru ditambahkan:
```bash
ab -n 100 -c 10 -p login.json -T application/json http://atreides.it03.com/api/auth/login
```

### Bentuk Hasil No 20
<div align="center">
<img src = Images/no20.png style ="margin-bottom:15px">
</div>


