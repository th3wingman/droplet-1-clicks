#!/bin/bash
apt-get update && apt-get -y install gpg curl
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.border0.com/deb/gpg | gpg --dearmor -o /etc/apt/keyrings/border0.gpg
echo "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/border0.gpg] https://download.border0.com/deb/ stable main" > /etc/apt/sources.list.d/border0.list
apt-get -y update
apt-get -y install border0

chmod +x /sbin/border0-install.sh
#