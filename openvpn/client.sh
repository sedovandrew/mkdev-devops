#!/bin/bash

cp /vagrant/usb_flash/easy-rsa/easyrsa3/pki/issued/client.crt /etc/openvpn/
cp /vagrant/usb_flash/easy-rsa/easyrsa3/pki/private/client.key /etc/openvpn/
cp /vagrant/openvpn/client.conf /etc/openvpn/
cp /vagrant/openvpn/vpnup.sh /etc/openvpn/
cp /vagrant/openvpn/vpndown.sh /etc/openvpn/
cp /vagrant/openvpn/resolv.conf /etc/openvpn/

systemctl start openvpn@client
systemctl enable openvpn@client
