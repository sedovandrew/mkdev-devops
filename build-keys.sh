#!/bin/bash

. config

if [ ! $(which openvpn) ]; then
  echo "Openvpn is not installed. Required to create ta.key"
  exit 1
fi

if [ ! -d $USBFLASH ]; then
  mkdir $USBFLASH
fi

cd $USBFLASH

if [ ! -d $EASYRSA3_DIR ]; then
  git clone --quiet https://github.com/OpenVPN/easy-rsa.git
fi

cd $EASYRSA3_DIR

cat > vars <<EOF
set_var EASYRSA_BATCH "$BATCH"
set_var EASYRSA_KEY_SIZE $KEY_SIZE
EOF

./easyrsa init-pki
./easyrsa build-ca nopass
./easyrsa build-server-full server nopass
./easyrsa build-client-full client nopass
./easyrsa gen-dh
./easyrsa gen-crl
openvpn --genkey --secret pki/ta.key
