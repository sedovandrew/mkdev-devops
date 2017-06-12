# -*- mode: ruby -*-
# vi: set ft=ruby :

usb_flash="usb_flash/easy-rsa/easyrsa3/pki"

machines = [
  {
    "name" => "server",
    "ip" => "192.168.90.100",
    "script" => "openvpn/server.sh"
  },
  {
    "name" => "client",
    "ip" => "192.168.90.101",
    "script" => "openvpn/client.sh"
  }
]

if not Dir.exist?(usb_flash)
  puts "Pki is not created. Run ./build-keys.sh first."
  exit
end

Vagrant.configure("2") do |config|
  config.vm.box = "sedovandrew/mkdev"
  machines.each do |machine|
    config.vm.define machine["name"] do |m|
      m.vm.hostname = machine["name"]
      m.vm.network "private_network", ip: machine["ip"]
      m.vm.provision "shell", path: "openvpn/common.sh"
      m.vm.provision "shell", path: machine["script"]
    end
  end
end
