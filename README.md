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
- [Topologi](#topologi)
- [Konfigurasi](#konfigurasi)
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

# Topologi

<div align="center">
    <img src="Images/Topologi.png" alt="Topologi">
</div>  

# Konfigurasi
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