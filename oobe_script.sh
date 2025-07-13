#!/bin/bash
root_password=$(tr -dc A-Za-z0-9 </dev/urandom | head -c 13; echo)
echo "changeme" | sudo -S touch /etc/root_password
echo "changeme" | echo $root_password | sudo tee -a /etc/root_password
echo "changeme" | sudo -S chown root:root /etc/root_password
echo "changeme" | sudo -S chmod 700 /etc/root_password
echo /etc/root_password | sudo -S adduser elevate
sudo usermod -aG sudo elevate
echo /etc/root_password | sudo -S apt update -y && sudo -S apt upgrade -y
sudo do-release-upgrade -y
DEBIAN_FRONTEND=noninteractive sudo apt install sddm kde-full plasma-workspace-wayland -y
sudo snap install geforcenow-electro -y
sudo apt install gamescope -y
cd /home/ivinish/Desktop
wget https://raw.githubusercontent.com/mereknighthawk/ivinos/refs/heads/main/update.sh
sudo chmod +x update.sh
sudo chmod 755 update.sh
sudo chown root:root update.sh
sudo ln -s /home/ivinish/Desktop/update.sh /etc/sudoers.d/
wget https://raw.githubusercontent.com/mereknighthawk/ivinos/refs/heads/main/upgrade.sh
sudo chmod +x upgrade.sh
sudo chmod 755 upgrade.sh
sudo chown root:root upgrade.sh
sudo ln -s /home/ivinish/Desktop/update.sh /etc/sudoers.d/
