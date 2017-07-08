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
