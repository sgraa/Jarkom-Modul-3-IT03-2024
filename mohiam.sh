
interfaces="INTERFACESv4=\"eth0\"
INTERFACESv6=\"\"
"
echo "$interfaces" > /etc/default/isc-dhcp-server

subnet="option domain-name \"example.org\";
option domain-name-servers ns1.example.org, ns2.example.org;

default-lease-time 600;
max-lease-time 7200;

ddns-update-style-none;

subnet 10.65.1.0 netmask 255.255.255.0 {
    range 10.65.1.14 10.65.1.28;
    range 10.65.1.49 10.65.1.70;
    option routers 10.65.1.0;
    option broadcast-address 10.65.1.255;
    option domain-name-servers 10.65.3.2;
    default-lease-time 300;
    max-lease-time 5220;
}

subnet 10.65.2.0 netmask 255.255.255.0 {
    range 10.65.2.15 10.65.2.25;
    range 10.65.2.200 10.65.2.210;
    option routers 10.65.2.0;
    option broadcast-address 10.65.2.255;
    option domain-name-servers 10.65.3.2;
    default-lease-time 1200;
    max-lease-time 5220;
}

subnet 10.65.3.0 netmask 255.255.255.0 {
}

subnet 10.65.4.0 netmask 255.255.255.0 {
}

host Dmitri {
    hardware ethernet 92:6a:4b:8f:b3:cf;
    fixed-address 10.65.1.67;
}
"
echo "$subnet" > /etc/dhcp/dhcpd.conf

service isc-dhcp-server restart