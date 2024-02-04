#!/bin/bash
apt-get update && apt-get -y install gpg curl
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.border0.com/deb/gpg | gpg --dearmor -o /etc/apt/keyrings/border0.gpg
echo "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/border0.gpg] https://download.border0.com/deb/ stable main" > /etc/apt/sources.list.d/border0.list
apt-get -y update
apt-get -y install border0

chmod +x /sbin/border0-install.sh
#

# this is required bot 999-img_check.sh to pass
apt-get -y purge droplet-agent
apt-get -y purge do-agent
rm -fr /opt/digitalocean

# clean up log files
rm -frv /var/log/ubuntu-advantage.log
rm -frv /var/log/kern.log
rm -frv /var/log/auth.log
## end of 010-border0.sh