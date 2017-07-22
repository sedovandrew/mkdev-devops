dnsmaster
=========

DNS master

Role Variables
--------------

    dnsclient_public_key
    dns_server
    dns_zone

Dependencies
------------

No.

Example Playbook
----------------

    - hosts: servers
      roles:
         - { role: dnsmaster, dns_server: dnsmaster, dns_zone: mkdev, dnsclient_public_key: "<some key>" }

License
-------

BSD

Author Information
------------------

Sedov Andrew (sedoy80@gmail.com)
