text
lang en_US.UTF-8
keyboard us
timezone US/Eastern
selinux --enforcing
firewall --enabled
services --enabled=sshd,systemd-networkd,systemd-resolved,chronyd,zram-swap
network --bootproto=dhcp --device=link --activate
reboot

zerombr
clearpart --all --initlabel --disklabel=gpt
autopart --type=plain --noswap
bootloader --timeout=1

url --mirrorlist=https://mirrors.fedoraproject.org/mirrorlist?repo=fedora-$releasever&arch=$basearch
repo --name=fedora --mirrorlist=https://mirrors.fedoraproject.org/mirrorlist?repo=fedora-$releasever&arch=$basearch
repo --name=updates --mirrorlist=https://mirrors.fedoraproject.org/mirrorlist?repo=updates-released-f$releasever&arch=$basearch
#repo --name=updates-testing --mirrorlist=https://mirrors.fedoraproject.org/mirrorlist?repo=updates-testing-f$releasever&arch=$basearch
repo --name=enarx --baseurl=https://download.copr.fedorainfracloud.org/results/npmccallum/enarx/fedora-$releasever-$basearch/

rootpw --lock --iscrypted locked
user --name=npmccallum --groups=wheel --lock
sshkey --username=npmccallum "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBIoZP5bZedmrj/lidLkKXhvZwwl9Pj5VxLV22nXhkijt7UJhSUX/rOV4Kg/wmR5ptMjGyE4PPSHmCEzXvQnpyMU= nathaniel@mccallum.life"

%packages
@hardware-support
@core

glibc-langpack-en
rng-tools
chrony
kernel
zram

-dracut-config-generic
-dracut-config-rescue
-xkeyboard-config
-NetworkManager
-usb_modeswitch
-gnome-keyring
-iproute-tc
-trousers
-alsa*
-b43*
-iwl*
-ipw*
%end

%post
# Allow users in the wheel group to use sudo without a password
install -o root -g root -m 600 /dev/stdin /etc/sudoers.d/nopasswd <<EOF
%wheel	ALL=(ALL)	NOPASSWD: ALL
EOF

# Use systemd-networkd and systemd-resolved
ln -sf /run/systemd/resolve/resolv.conf /etc/resolv.conf
rm -f /etc/sysconfig/network-scripts/ifcfg-*
cat >/etc/systemd/network/ether.network <<EOF
[Match]
Type=ether

[Network]
DHCP=yes
EOF
%end
