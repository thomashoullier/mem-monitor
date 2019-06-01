#!/bin/sh

FILE="/home/modi/repos/mem-monitor/test.txt"
interval=0.01
length=1
pid=1244

# Command to execute during monitoring
comm="cat /proc/$pid/statm | cut --delimiter=' ' -f2"
# Page size in KB
pagesize=$(($(getconf PAGESIZE) / 1024))
# Length of time of monitoring in milliseconds
length=$((length * 1000))
# Header
strbuf=$(printf "time data")

#     Date in milliseconds
curdate=$(date +%s%3N)
enddate=$((curdate + length))
while [ "$curdate" -lt "$enddate" ]
do
	curdate=$(date +%s%3N)
	strbuf=$(printf "%s\n%s %s" "$strbuf" "$curdate" "$(($(eval "$comm") * pagesize))")
        sleep $interval
done

# Write to file
printf "%s\n" "$strbuf" >> $FILE

echo "DONE"
