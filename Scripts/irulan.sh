#JANGAN LUPA GANTI RESOLV.CONF CLIENT (DMITRI/PAUL) KE IP IRULAN (10.65.3.2)

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