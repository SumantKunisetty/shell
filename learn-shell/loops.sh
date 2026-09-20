for service in auth-servie portfolio-service analytics-service; do
    echo "starting the ${service}"
done

x=5
while [ $x -gt 0 ]; do
    echo "value: $x"
    x=$(x-1)
done