dnsclient
=========

DNS client

Role Variables
--------------

    host_name
    dns_zone
    dns_client_public_key

Dependencies
------------

No.

Example Playbook
----------------

    - hosts: servers
      roles:
         - { role: dnsclient, host_name: dnsclient, dns_zone: mkdev, dns_client_public_key: "<some key>" }

License
-------

BSD

Author Information
------------------

Sedov Andrew (sedoy80@gmail.com)
