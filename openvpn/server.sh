#!/bin/bash

cp /vagrant/usb_flash/easy-rsa/easyrsa3/pki/issued/server.crt /etc/openvpn/
cp /vagrant/usb_flash/easy-rsa/easyrsa3/pki/private/server.key /etc/openvpn/
cp /vagrant/usb_flash/easy-rsa/easyrsa3/pki/dh.pem /etc/openvpn/
cp /vagrant/openvpn/server.conf /etc/openvpn/

systemctl start openvpn@server
systemctl enable openvpn@server

firewall-cmd --permanent --zone=public --add-service=openvpn
firewall-cmd --reload
