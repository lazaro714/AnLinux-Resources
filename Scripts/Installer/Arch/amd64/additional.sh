systemctl disable systemd-resolved.service
service systemd-resolved stop
rm /etc/resolv.conf
mv resolv.conf /etc