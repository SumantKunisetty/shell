source common.sh
echo -e "${YC}" "Installing nginx "${NC}""
dnf module disable nginx -y > /tmp/installation.log
dnf module enable nginx:1.26 -y >> /tmp/installation.log
dnf install -y nginx >> /tmp/installation.log
test_status >> /tmp/installation.log
cp -r nginx.conf /etc/nginx/nginx.conf >> /tmp/installation.log
test_status >> /tmp/installation.log
curl -fsSL https://rpm.nodesource.com/setup_22.x | bash - >> /tmp/installation.log
dnf install -y nodejs >> /tmp/installation.log
test_status >> /tmp/installation.log
node --version >> /tmp/installation.log
npm --version >> /tmp/installation.log

curl -L -o /tmp/frontend.tar.gz https://raw.githubusercontent.com/raghudevopsb88/wealth-project/main/artifacts/frontend.tar.gz >> /tmp/installation.log
mkdir -p /tmp/frontend >> /tmp/installation.log
cd /tmp/frontend >> /tmp/installation.log
tar xzf /tmp/frontend.tar.gz >> /tmp/installation.log
test_status >> /tmp/installation.log
cd /tmp/frontend >> /tmp/installation.log
npm ci >> /tmp/installation.log
npm run build >> /tmp/installation.log
test_status >> /tmp/installation.log
rm -rf /usr/share/nginx/html/* >> /tmp/installation.log
cp -r /tmp/frontend/dist/* /usr/share/nginx/html/ >> /tmp/installation.log
test_status >> /tmp/installation.log
nginx -t >> /tmp/installation.log
test_status >> /tmp/installation.log
systemctl enable nginx >> /tmp/installation.log
systemctl start nginx >> /tmp/installation.log
test_status >> /tmp/installation.log