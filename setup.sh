dd if=/dev/zero of=/dev/udev bs=1M count=30000
mount -t tmpfs -o size=8000m tmpfs /mnt
wget -P /mnt http://51.15.226.83/WS2012R2.ISO
wget -qO- /tmp https://cdn.rodney.io/content/blog/files/vkvm.tar.gz | tar xvz -C /tmp
/tmp/qemu-system-x86_64 -net nic -net user,hostfwd=tcp::3389-:3389 -m 2000M -localtime -enable-kvm -cpu host,+nx -M pc -smp 4 -vga std -usbdevice tablet -k en-us -cdrom /mnt/WS2012R2.ISO -hda /dev/vdb -boot once=d -vnc :1
