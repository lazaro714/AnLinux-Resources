systemctl disable systemd-resolved.service
rm /etc/resolv.conf
mv resolv.conf /etc