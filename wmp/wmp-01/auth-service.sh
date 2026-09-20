service_name=auth-service
dnf install -y golang
cp {service_name}.service /etc/systemd/system/
useradd -r -s /bin/false appuser
mkdir -p /app
curl -L -o /tmp/{service_name}.tar.gz https://raw.githubusercontent.com/raghudevopsb88/wealth-project/main/artifacts/{service_name}.tar.gz
cd /app
tar xzf /tmp/{service_name}.tar.gz
cd /app
CGO_ENABLED=0 go build -o {service_name} ./cmd/server
chown -R appuser:appuser /app
chmod o-rwx /app -R
#systemctl commands
systemctl daemon-reload
systemctl enable {service_name}
systemctl start {service_name}