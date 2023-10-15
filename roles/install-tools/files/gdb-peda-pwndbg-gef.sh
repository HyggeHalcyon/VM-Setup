#!/bin/sh

# ===================================================================================
# CREDIT TO: https://github.com/apogiatzis/gdb-peda-pwndbg-gef/blob/master/install.sh
# ===================================================================================

cd tmp

echo "[+] Checking for required dependencies..."
if command -v git >/dev/null 2>&1 ; then
    echo "[-] Git found!"
else
    echo "[-] Git not found! Aborting..."
    echo "[-] Please install git and try again."
    exit
fi

if [ -f ~/.gdbinit ] || [ -h ~/.gdbinit ]; then
    echo "[+] backing up gdbinit file"
    cp ~/.gdbinit ~/.gdbinit.bak
fi

# download peda 
if [ -d ~/peda ] || [ -h ~/.peda ]; then
    echo "[-] PEDA found"
else
    echo "[+] Downloading PEDA..."
    git clone https://github.com/longld/peda.git /tmp/peda
fi

# download peda arm
if [ -d ~/peda-arm ] || [ -h ~/.peda ]; then
    echo "[-] PEDA ARM found"
else	    
    echo "[+] Downloading PEDA ARM..."
    git clone https://github.com/alset0326/peda-arm.git /tmp/peda-arm
fi

# download pwndbg
if [ -d ~/pwndbg ] || [ -h ~/.pwndbg ]; then
    echo "[-] Pwndbg found"
else
    echo "[+] Downloading Pwndbg..."
    git clone https://github.com/pwndbg/pwndbg.git /tmp/pwndbg

    cd ~/pwndbg
    ./setup.sh
fi

# download gef
if [ -d ~/gef ] || [ -h ~/.gef ]; then
    echo "[-] GEF found"
else
    echo "[+] Downloading GEF..."
    git clone https://github.com/hugsy/gef.git /tmp/gef

    cd ~/pwndbg
    ./setup.sh
fi

echo "[+] Setting .gdbinit..."
cp /tmp/gdbinit ~/.gdbinit          # i script ansible to move the templates to tmp

{
  echo "[+] Creating files..."
    cp gdb-peda /usr/bin/gdb-peda &&\
    cp gdb-peda-arm /usr/bin/gdb-peda-arm &&\
    cp gdb-peda-intel /usr/bin/gdb-peda-intel &&\
    cp gdb-pwndbg /usr/bin/gdb-pwndbg &&\
    cp gdb-gef /usr/bin/gdb-gef
} || {
  echo "[-] Permission denied"
    exit
}

{
  echo "[+] Setting permissions..."
    chmod +x /usr/bin/gdb-*
} || {
  echo "[-] Permission denied"
    exit
}

echo "[+] Done"