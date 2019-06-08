#!/bin/sh

# Input check
if [ ! $# -eq 4 ]
then
	echo "mem-monitor: Invalid number of arguments." >&2
        exit 1
fi

pid=$1
length=$2
interval=$3
FILE=$4

#Delete the data file if it already exists
if [ -e "$FILE" ]
then
	rm "$FILE"
fi

# Command to execute during monitoring
comm="cat /proc/$pid/statm | cut --delimiter=' ' -f2"
# Page size in KB
pagesize=$(($(getconf PAGESIZE) / 1024))
# Length of time of monitoring in milliseconds
length=$((length * 1000))
# Header
strbuf=$(printf "time data")

#     Date in milliseconds
begdate=$(date +%s%3N)
curdate=$(($(date +%s%3N) - begdate))
while [ "$curdate" -lt "$length" ]
do
	curdate=$(($(date +%s%3N) - begdate))
	strbuf=$(printf "%s\n%s %s" "$strbuf" "$curdate" "$(($(eval "$comm") * pagesize))")
	sleep "$interval"
done

# Write to file
printf "%s\n" "$strbuf" >> "$FILE"

echo "DONE"
