for service in auth-servie portfolio-service analytics-service; do
    echo "starting the ${service}"
done

x=5
while [$x -lt 0]; do
    echo $x
    $x = $x -1
done