app_prereq(){
    id appuser &>/dev/null
    if [ $? -eq 0 ]; then
        echo "app user already exists"
    else
        useradd -r -s /bin/false appuser
    fi
    mkdir -p /app
    curl -L -o /tmp/${service_name}.tar.gz https://raw.githubusercontent.com/raghudevopsb88/wealth-project/main/artifacts/${service_name}.tar.gz
    cd /app
    tar xzf /tmp/${service_name}.tar.gz
}