#!/bin/bash

yum install -y epel-release

yum install -y openvpn

cp /vagrant/usb_flash/easy-rsa/easyrsa3/pki/ca.crt /etc/openvpn/
cp /vagrant/usb_flash/easy-rsa/easyrsa3/pki/ta.key /etc/openvpn/
