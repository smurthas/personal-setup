# add ubuntu user
apt-get update -y
adduser --disabled-password --gecos "" ubuntu
mkdir /home/ubuntu/.ssh
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDwCS32DZ8pEfu10RQ2rw6ptVY5Ens83HZn0VofkM2e81VhtX2QZLvIzg+NiErD3Q+09cT+3AVdp6/55LtvnalKLHHw0ewLlbQnraYJzD+QVmfEyN0XtJozCIoRKHY7Z3ZTiqTjr1gXzXTRB11x5DimMSiF37kJeF6oVXhb/FgoD/4ZA3POt2925WC41WXI5kAg2A046IxuaUGJlK9xKwSbH3bFK2NI8iUXzvXJtWmPKoL4sV9H6lGNdiuJCx+RCxxC1TClB7nFC10Ul4iZHEVipkdHKyghZsLmM8GDLGGCcJe9X5UMZDEqxrn7ujQczgqGUp7MVZNnSAyU8FzuUiAH simon@murtha-smith.com" > /home/ubuntu/.ssh/authorized_keys
chown -R ubuntu.ubuntu /home/ubuntu
echo "ubuntu ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
apt-get install -y git
apt-get install -y vim-nox


# New Relic (via
# https://rpm.newrelic.com/accounts/597851/servers/get_started#platform=debian)
echo deb http://apt.newrelic.com/debian/ newrelic non-free >> /etc/apt/sources.list.d/newrelic.list
wget -O- https://download.newrelic.com/548C16BF.gpg | apt-key add -
apt-get update

apt-get install -y newrelic-sysmond
nrsysmond-config --set license_key=$NEW_RELIC_LICENSE_KEY
/etc/init.d/newrelic-sysmond start


# install docker
apt-get update
apt-get install -y linux-image-extra-`uname -r`

apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
echo deb http://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list
apt-get update
apt-get install -y lxc-docker

groupadd docker
gpasswd -a ubuntu docker

# install personal env
git clone https://github.com/smurthas/.files.git /tmp/.files
pushd /tmp/.files
/tmp/.files/install.sh
popd
