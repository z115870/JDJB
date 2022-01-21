#!/bin/sh
yum -y update
yum -y install nano screen ncftp
yum -y groupinstall "Development Tools"
yum -y install readline-devel ncurses-devel openssl-devel
yum -y  install yum-utils
yum-config-manager --add-repo https://pkgs.tailscale.com/stable/centos/7/tailscale.repo
yum -y  install tailscale
systemctl enable --now tailscaled
tailscale up
paulse
tailscale up --advertise-exit-node
cd ~
wget https://github.com/SoftEtherVPN/SoftEtherVPN_Stable/releases/download/v4.38-9760-rtm/softether-vpnserver-v4.38-9760-rtm-2021.08.17-linux-x64-64bit.tar.gz
tar -xvzf softether-vpnserver-v4.38-9760-rtm-2021.08.17-linux-x64-64bit.tar.gz
cd vpnserver
make

