#!/bin/bash
echo -e "Starting Border0 Connector Install Script"

mkdir -p /opt/border0 || true
touch /opt/border0/border0.install.log || true

/usr/bin/border0 connector install | tee -a /opt/border0/border0.install.log

# post install
cat <<EOF
********************************************************************************
Please consider closing off port 22 on your firewall
:~# ufw deny ssh

Border0 Connector comes with build in Built-in SSH server
https://docs.border0.com/docs/using-the-built-in-border0-ssh-server
********************************************************************************
EOF

# ask user for input y or N
cat <<EOF
********************************************************************************

Border0 Connector integrates with Digital Ocean API for resource discovery
We will need to initiate doctl tooling and create API token for that

EOF

read -p "Would you like to enable Digital-Ocean Plugin and initialize doctl toolset? (y/N) " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo -e "\nInitializing Digital-Ocean Tooling"
    if [ ! -d "/root/.config" ]; then mkdir -p /root/.config ; fi
    doctl auth init

fi
echo <<EOF
********************************************************************************
Border0 Connector Install Script Completed

EOF

exit 0
#