# Task # 1

TODO

# Task # 2

TODO

# Task # 3

TODO

# Task # 4

    vagrant up kernel
    ./attach-floppy.sh
    vagrant reload kernel
    vagrant ssh kernel

# Task # 5

    vagrant up nexus workspace
    vagrant ssh workspace

In workspace.mkdev:

    puppet apply -e "include fastblank"

# Task # 6

    vagrant up dnsmaster dnsclient
    ansible-playbook ansible/all.yml -i ansible/inventory --ask-become-pass --ask-vault-pass

Password for encryped data is **task-six**.

    vagrant up server
    vagrant up client
