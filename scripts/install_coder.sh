curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

apt install curl

curl -L https://coder.com/install.sh | sh
systemctl enable --now coder
journalctl -u coder.service -b

wget https://go.dev/dl/go1.21.0.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.21.0.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin

apt install -y debian-keyring debian-archive-keyring apt-transport-https
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/xcaddy/gpg.key' | sudo gpg --dearmor -o /usr/share/keyrings/caddy-xcaddy-archive-keyring.gpg
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/xcaddy/debian.deb.txt' | sudo tee /etc/apt/sources.list.d/caddy-xcaddy.list
apt update
apt install xcaddy
xcaddy build --with github.com/caddy-dns/cloudflare
mv ./caddy /usr/bin/caddy

groupadd --system caddy
useradd --system --gid caddy --create-home --home-dir /var/lib/caddy --shell /usr/sbin/nologin --comment "Caddy web server" caddy
systemctl enable --now caddy
systemctl start caddy

mkdir -p /srv/shared_workspace
chmod 777 /srv/shared_workspace

sudo groupadd docker
sudo usermod -aG docker coder
sudo usermod -aG docker vlab