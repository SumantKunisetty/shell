source common.sh
service_name=portfolio-service
dnf install -y java-21-openjdk-devel
java -version
cp ${service_name}.service /etc/systemd/system/
app_prereq
cd /app
chmod +x gradlew
./gradlew bootJar --no-daemon -x test
cp /app/build/libs/*.jar /app/${service_name}.jar
chown -R appuser:appuser /app
chmod o-rwx /app -R
systemctl daemon-reload
systemctl enable ${service_name}
systemctl start ${service_name}