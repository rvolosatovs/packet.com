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

group --name=sgx
group --name=sev

## User Policy
## 1. User names MUST match GitHub accounts
## 2. Users MUST be locked
## 3. Users MUST define an ssh key
## 4. Users MAY have access to the sgx/sev groups
rootpw --lock --iscrypted locked
sshkey --username=root "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBIoZP5bZedmrj/lidLkKXhvZwwl9Pj5VxLV22nXhkijt7UJhSUX/rOV4Kg/wmR5ptMjGyE4PPSHmCEzXvQnpyMU= npmccallum@redhat.com"

user --name=npmccallum --lock
sshkey --username=npmccallum "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBIoZP5bZedmrj/lidLkKXhvZwwl9Pj5VxLV22nXhkijt7UJhSUX/rOV4Kg/wmR5ptMjGyE4PPSHmCEzXvQnpyMU= npmccallum@redhat.com"

user --name=mbestavros --lock
sshkey --username=mbestavros "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCsU/LopyQqsuwKZ/I1FKhzXxvRtamvS1pO/XArdM8/pJ2/CErgCxfrudZLR0Am4aqqQ1Luf3F6EVjiLKeQpqoTSc1tQYAXlUI8oqRLyh9j8G765dUzW5/ebMaIpzZGw5DlJKMXR3dM5pwXTSn8KXUmSqzi+mZNlJVaf4usFqkA35AixbuuibtngN3+wz1bAKtZmWy4j0KlA5MZFSTz+M2IWMhJdSXdospCcj7k76VH2PlCjMyH+bfUcbVQT7U6agzTVnk0qG2aptnhnfgV6HpWX8KFo0ajHigpPm7kRmWxk9PUlS3N4hIgu01TndMjDl9HIVIfF4MoRniVwVx7pDe7uaxOUNGVPOS+Pv7B8WD0nDxbOGuekPdTzZzceqEow36yOwzKUe/vgFls2ipVSfJAZfEZiFx07oZ1DLgJ7aibmF+LQygVDWyT7fb4Vrf7A1rDY+b8JoCItuP/ZODN4G8eXtYE4YRY799/+VmtU8xMAHYoMiG2QNz+X6gyyVVaoA1aPB01YRpQjkICqTJY9Wgwx1yw4rRel6pMKFUdeHlHRSaGm1Lq8sx4MXhb9qqAnqxVXO8SFFMHLRkHklZoz1Kl6OBeYHpH0ob+n/seyGmZz8TRBTOS21NnydCAHlemzbOwnoHCHFxGxdJ6Sb5IRQYkx666/7bmZzLsxos74BLDGQ== mbestavr@redhat.com"

user --name=lkatalin --lock
sshkey --username=lkatalin "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDaSL2QaBqFlZrmfYKFV81+eM+1l5PzQAevLcWkZhpYXHIzZmTazp6AQcpin77Ip4v88GwLnLifuf/xBVNozH7/bRTpj8q1ynJGcpMJrau7DGRj6Afr4b4kzgAZBq6tTXxzXAIekzcCv+n/Ew8DlDpWubR7Nyckt9ak+dNkXXQKOC1lnqU+noatRjfXK4BNn5RsTxXuRvExmSNqLvzGlQIITcKi3M49bqceRVYGV0K0QPbWWNsYhz2VyBH7jYOiTKiu8zBN4p+cpSUdMARsAcWZITeALYMuzIPLLk60exxe1lqRj2uRg9enPro1rk98L/rLM1pjftlRMZtn3L/+VnuxMpNDzQx2pSD2WoL1IOkMDQbwuROke1S8O4KY/9ygYSs2e9Eh4HxogjX+UKCLGlC0jzZcJYlV2X3U0ekCbWf/jPO64b4k9Jb48+xdw2f+dG4AckPG9I2GDH0b3INBGx77gC2IQsb4y3sXqys0vk4Zi4fTLkzW//6Fk8TBT6xVen9VbnsoJi6Gz9OcHIQSioF/sAwg0guBeZx9iWMDc93YjdyveUOlMP9assbL+0HVL5VQodcbJnmXbsNcZ3i/EE0TtzNMruEByTAwppA/jiDWRj/Dm77spXNDE/bQTz+NRWxca3wEePWSDdXFb+x8Ga21qaxKmpNz6z3teFVKI7qoaQ== lsturman@redhat.com"

user --name=connorkuehl --lock
sshkey --username=connorkuehl "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDbwqCwkJqRonnAiY/frDu8uVOOmo112ei24OU88J35jER+uiMaAWKGwPqF6V+Y4zjdT69rrjEfyNSQOwfAhdVFkZOARuBY4i5w0ZzvNd1H8Df4AFQvERMaIpcwQgCj/zf/tdb+zxh9TLd2TPDO0bQ1rhl5hhY7WBiIc1VLRRHJgnWi0gHqPpf+eccn6T71CSaeQDmSJ7ojJru6QXrIKfSVp6Cmm76IpczCfuoRYksvOS8o6utyQANhNw3zjf6l4kiF59Z/16g0XWGo8GrdTJeIXWsjq8YttK0MmCSRHk8p4GZiSgMk5sb7fmXuCD6Hr/IBuqQdtfSECRKfRbHHgmrVMVxB1+QW/N1GLKIxwHrAuYQ6DIWDTQJsGiJBmKM9FpLSJpzu1VG/6oWPcqLYmub71KVtAwfw7HZZ5ww2HKLy6DXjEFwFH5qBNqYJOHgbZXi5CnDeLsOTL1NwgOHV893VP62FvDemRIwR4W0yj6vIdiswGNKTwXTKEC9hdBSTTc9okUrq9mZtUFEk+mTiqnn1OFkbhflB/vk7IhepELv7k6qVdCri9hJ66biqzhNXorPAZg44JSr+LNP1X6GWh8ubFu+ijEudUua/FAr7HoBofC0cptA61N0s5EEBaAVx9yqw925jXovre4SAV1kvB9Vl4xTOiQ5spp+x+UE5QiIs4w== ckuehl@redhat.com"

user --name=whitebrandy --lock
sshkey --username=whitebrandy "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDo8OxuYPC0uXSv6W5DM0yTnkL4W0xWzzkhWkAU/BvOeLIFFc6JJ5F6PltmxpZcPCySkOYs456hMyTGLQid0v4zSBMX5/E8+djEIiinvd6hqY3JuFEqAsg1SXusL+IrI1qlcTjy9MJxWPntTZGQ4Kq1HzEpTBaIdRUaPdd6/6SsYWJKY3lwEt/JUOCx618qxhWcU2ms8xDu4zxcu4AiyQM46lqTGOSO5gWu+5g8CV+UNiJWiTGrRxXuekgwLCvkCuYoBcQs4Ojft1rFf3MaBhSdytphmQ6x4iE5JPnr01JTGbB6wneHmllS71EMJ7teizAF+/jPw8MCV2FGHOkPRG0FFBBiMODXC7StmoSEM9Y+tv1Lz9KavCElfn623X8CbxCSUalj/88I9rWocXQqBmxXU7mEGEGDGB0ZXZX7S9yZ3r8nzY4dITnXziw6IooaQURY6D7Oi94Znsggq3SwdzhhjSTUfSRppsLPqcUM5rD+0PekGC9UR+GSdjCslL6xqwE= bdas@redhat.com"

user --name=haraldh --lock
sshkey --username=haraldh "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC/ziasupvk3yQ6Tqb/JiQ6gPwdKzDR26S5W5w6byx3FYEztkiGLi8wsFC+mOWrirwVTma3M0TO1DnYjwXvsU7kSoQQarS8bG+CoPIifcF1a5SEeJKPifsYUIB7GSMUY4yomdRe7+AdP8nSqlHdoij6fN/+rfUs+3nTrq4TAkFyg5hqQBQp32DrM1Och5KXMvOCak75TQoxrfpKyhlCuoWVotnvxWMFgfCGUYC6Q2nKPn3y1EtFs9Y/Zi8H5VzLjrhmbJYd7yTA6HPBqDpEnaaL+vXAoqPC1Vzu+gI2jOumhg+4eN3kfbzP5Sz0ljhmYKpHBPE0+sPKMLtWZBW9gUSr cardno:000606910294"

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
# Give SGX and SEV device node access to their respective groups
cat > /etc/udev/rules.d/50-sgx.rules <<EOF
SUBSYSTEM=="sgx", KERNEL=="sgx/provision", GROUP="sgx", MODE="0660"
SUBSYSTEM=="sgx", KERNEL=="sgx/enclave", MODE="0666"
EOF

echo 'KERNEL=="sev", MODE="0660", GROUP="sev"' > /etc/udev/rules.d/50-sev.rules

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
