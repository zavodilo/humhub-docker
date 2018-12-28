#!/bin/sh

# Thx to Sanj Ambalavanar (https://sanjeevan.co.uk/blog/running-services-inside-a-container-using-runit-and-alpine-linux/)

# kill any other processes still running in the container
for _pid  in $(ps -eo pid | grep -v PID  | tr -d ' ' | grep -v '^1$' | head -n -6); do
  timeout -t 5 /bin/sh -c "kill $_pid && wait $_pid || kill -9 $_pid"
done
exit
