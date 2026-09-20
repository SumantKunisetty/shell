source common
echo -e "${YC}" "Installing nginx "${NC}""
dnf module disable nginx -y
dnf module enable nginx:1.26 -y
dnf install -y nginx
if [ $? -eq 0]; then
    echo "Installation is successful" 
else
    echo "Installation is not success"
fi
cp -r nginx.conf /etc/nginx/nginx.conf

curl -fsSL https://rpm.nodesource.com/setup_22.x | bash -
dnf install -y nodejs

node --version
npm --version

curl -L -o /tmp/frontend.tar.gz https://raw.githubusercontent.com/raghudevopsb88/wealth-project/main/artifacts/frontend.tar.gz
mkdir -p /tmp/frontend
cd /tmp/frontend
tar xzf /tmp/frontend.tar.gz

cd /tmp/frontend
npm ci
npm run build

rm -rf /usr/share/nginx/html/*
cp -r /tmp/frontend/dist/* /usr/share/nginx/html/

nginx -t

systemctl enable nginx
systemctl start nginx