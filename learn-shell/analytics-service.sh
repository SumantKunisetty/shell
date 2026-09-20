dnf install -y python3.12 python3.12-pip python3.12-devel gcc
python3.12 --version
useradd -r -s /bin/false appuser
cp analytics-service.service /etc/systemd/system/
mkdir -p /app
curl -L -o /tmp/analytics-service.tar.gz https://raw.githubusercontent.com/raghudevopsb88/wealth-project/main/artifacts/analytics-service.tar.gz
cd /app
tar xzf /tmp/analytics-service.tar.gz
cd /app
pip3.12 install --no-cache-dir .
chown -R appuser:appuser /app
chmod o-rwx /app -R
systemctl daemon-reload
systemctl enable analytics-service
systemctl start analytics-service