for service in auth-servie portfolio-service analytics-service; do
    echo "starting the ${service}"
done

x=5
while [ $x -gt 0 ]; do
    echo "value: $x"
    x=$((x-1))
done

nc -w 2 -z localhost 3000
while [ $? -ne 0 ]; do
    sleep 2
    echo trying again after 2 seconds
    nc -w 2 -z localhost 3000
done
