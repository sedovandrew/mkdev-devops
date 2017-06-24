# -*- mode: ruby -*-
# vi: set ft=ruby :

usb_flash="usb_flash/easy-rsa/easyrsa3/pki"

machines = [
  {
    "name" => "server",
    "ip" => "192.168.90.100",
    "scripts" => [
      "openvpn/common.sh",
      "openvpn/server.sh"
    ]
  },
  {
    "name" => "client",
    "ip" => "192.168.90.101",
    "scripts" => [
      "openvpn/common.sh",
      "openvpn/client.sh"
    ]
  }
]

Vagrant.configure("2") do |config|
  config.vm.box = "sedovandrew/mkdev"

  machines.each do |machine|
    config.vm.define machine["name"] do |m|
      m.vm.hostname = machine["name"]
      m.vm.provider "libvirt"
      if machine["ip"]
        m.vm.network "private_network", ip: machine["ip"]
      end

      if ["up", "provision"].include? ARGV[0]
        if not Dir.exist?(usb_flash)
          puts "Pki is not created. Run ./build-keys.sh first."
          exit
        end
      end

      if machine["scripts"]
        machine["scripts"].each do |script|
          m.vm.provision "shell", path: script
        end
      end
    end
  end

  config.vm.define "kernel" do |kernel|
    kernel.vm.box = "sedovandrew/mkdev30g"
    kernel.vm.hostname = "kernel"
    kernel.vm.provider "libvirt" do |domain|
      domain.memory = 4096
      domain.cpus = 3
    end
    kernel.vm.provision "file", source: "kernel/check-floppy.sh", destination: "/home/vagrant/check-floppy.sh"
    kernel.vm.provision "shell", path: "kernel/build-kernel.sh"
  end

end
