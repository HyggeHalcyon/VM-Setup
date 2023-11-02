# VM-Setup
This is an automated setup for my box I use on daily basis either for offensive security or general development routines. tested on ParrotOS 5.3  
  
<sub>Inspired by [ippsec](https://github.com/IppSec/parrot-build)</sub>

## Prerequisites
- install ansible `python3 -m pip install ansible`
- install [cargo](https://www.rust-lang.org/tools/install) as it is not automated yet 

## Run the Playbook
```
sudo whoami
ansible-playbook main.yml
```

## VMWare Sharefolder
```
vmware-hgfsclient
mkdir ~/SharedFolder
sudo vmhgfs-fuse .host:/Shared-Folder SharedFolder -o allow_other -o uid=1000
```

## To-Do
- Setup Docker
- Setup Cargo

## References: 
- [tmux](https://www.youtube.com/watch?v=Lqehvpe_djs)
- [peda-pwndbg-gef](https://github.com/apogiatzis/gdb-peda-pwndbg-gef/blob/master/install.sh)
- [set-up ghidra](https://github.com/scrool/ansible-role-ghidra)
- [sharefolder](https://alexandrerosseto.medium.com/vmware-linux-how-to-share-folder-between-host-and-vm-62e63419ecbb)